# frozen_string_literal: true

require "test_helper"
require "socket"

# Goes through excon's real socket layer (no mocks) against a local server,
# to catch incompatibilities between excon and the running Ruby.
class HTTPTest < MandrillTest
  def setup
    super
    Excon.defaults[:mock] = false
    @server = TCPServer.new("127.0.0.1", 0)
    @received = Queue.new
  end

  def teardown
    @thread&.kill
    @server&.close
    super
  end

  def serve(status, body)
    @thread = Thread.new do
      client = @server.accept
      head = +""
      head << client.readline until head.end_with?("\r\n\r\n")
      length = head[/^content-length:\s*(\d+)/i, 1].to_i
      @received << [head, client.read(length)]
      client.write "HTTP/1.1 #{status} X\r\nContent-Type: application/json\r\n" \
                   "Content-Length: #{body.bytesize}\r\nConnection: close\r\n\r\n#{body}"
      client.close
    end
  end

  def client
    api = Mandrill::API.new("live-key")
    saved = {}
    ENV.keys.grep(/\A(https?|no)_proxy\z/i).each { |k| saved[k] = ENV.delete(k) }
    api.session = Excon.new("http://127.0.0.1:#{@server.addr[1]}")
    api
  ensure
    saved&.each { |k, v| ENV[k] = v }
  end

  def test_round_trip_over_a_real_socket
    serve(200, '{"PING":"PONG!"}')

    assert_equal({ "PING" => "PONG!" }, client.users.ping)

    head, body = @received.pop
    assert_match %r{\APOST /api/1\.0/users/ping2\.json HTTP/1\.1}, head
    assert_match %r{^Content-Type: application/json}i, head
    assert_equal({ "key" => "live-key" }, JSON.parse(body))
  end

  def test_error_status_over_a_real_socket
    serve(500, '{"status":"error","name":"Invalid_Key","message":"nope"}')
    assert_raises(Mandrill::InvalidKeyError) { client.users.ping }
  end
end
