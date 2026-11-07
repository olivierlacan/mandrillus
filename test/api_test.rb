# frozen_string_literal: true

require "test_helper"

class APITest < MandrillTest
  def test_uses_explicit_api_key
    assert_equal "explicit", Mandrill::API.new("explicit").apikey
  end

  def test_reads_api_key_from_environment
    ENV["MANDRILL_APIKEY"] = "from-env"
    assert_equal "from-env", Mandrill::API.new.apikey
  end

  def test_reads_api_key_from_home_config_file
    ENV.delete("MANDRILL_APIKEY")
    Dir.mktmpdir do |home|
      ENV["HOME"] = home
      File.write(File.join(home, ".mandrill.key"), "from-file\n")
      assert_equal "from-file", Mandrill::API.new.apikey
    end
  end

  def test_raises_without_api_key
    ENV.delete("MANDRILL_APIKEY")
    Dir.mktmpdir do |home|
      ENV["HOME"] = home
      skip "/etc/mandrill.key exists on this machine" if File.exist?("/etc/mandrill.key")
      assert_raises(Mandrill::Error) { Mandrill::API.new }
    end
  end

  def test_call_posts_json_with_key_to_versioned_path
    stub_response(body: '{"PING":"PONG!"}')

    result = Mandrill::API.new("secret").users.ping

    assert_equal({ "PING" => "PONG!" }, result)
    request = @requests.last
    assert_equal :post, request[:method].to_s.downcase.to_sym
    assert_equal "/api/1.0/users/ping2.json", request[:path]
    assert_equal "application/json", request[:headers]["Content-Type"]
    assert_equal "mandrillapp.com", request[:host]
    assert_equal "https", request[:scheme]
    assert_equal({ "key" => "secret" }, last_payload)
  end

  def test_call_serializes_nested_params
    stub_response(body: "[]")
    message = { "to" => [{ "email" => "a@example.com" }], "subject" => "Hi" }

    Mandrill::API.new("k").messages.send(message, true, "Main Pool", "2026-01-01 00:00:00")

    assert_equal "/api/1.0/messages/send.json", @requests.last[:path]
    assert_equal message, last_payload["message"]
    assert_equal true, last_payload["async"]
    assert_equal "Main Pool", last_payload["ip_pool"]
    assert_equal "2026-01-01 00:00:00", last_payload["send_at"]
  end

  def test_known_api_errors_map_to_specific_classes
    {
      "ValidationError" => Mandrill::ValidationError,
      "Invalid_Key" => Mandrill::InvalidKeyError,
      "Unknown_Template" => Mandrill::UnknownTemplateError,
      "Unknown_MetadataField" => Mandrill::UnknownMetadataFieldError
    }.each do |name, klass|
      Excon.stubs.clear
      stub_response(status: 500, body: JSON.generate("status" => "error", "name" => name, "message" => "boom"))

      error = assert_raises(klass) { Mandrill::API.new("k").users.ping }
      assert_equal "boom", error.message
    end
  end

  def test_unknown_api_error_name_raises_base_error
    stub_response(status: 500, body: '{"status":"error","name":"Brand_New","message":"new"}')
    error = assert_raises(Mandrill::Error) { Mandrill::API.new("k").users.ping }
    assert_equal Mandrill::Error, error.class
    assert_equal "new", error.message
  end

  def test_non_json_error_body_raises_base_error
    stub_response(status: 502, body: "<html>Bad Gateway</html>")
    error = assert_raises(Mandrill::Error) { Mandrill::API.new("k").users.ping }
    assert_match(/unexpected error.*Bad Gateway/, error.message)
  end

  def test_malformed_error_payload_raises_base_error
    stub_response(status: 500, body: '{"status":"ok"}')
    assert_raises(Mandrill::Error) { Mandrill::API.new("k").users.ping }
  end

  def test_errors_are_rescuable_as_standard_error
    stub_response(status: 500, body: '{"status":"error","name":"Invalid_Key","message":"x"}')
    rescued = begin
      Mandrill::API.new("k").users.ping
      nil
    rescue => e # bare rescue only catches StandardError
      e
    end
    assert_kind_of Mandrill::InvalidKeyError, rescued
  end
end
