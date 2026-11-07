# frozen_string_literal: true

require "minitest/autorun"
require "tmpdir"
require "mandrill"

class MandrillTest < Minitest::Test
  def setup
    Excon.defaults[:mock] = true
    @requests = []
    @saved_env = { "MANDRILL_APIKEY" => ENV["MANDRILL_APIKEY"], "HOME" => ENV["HOME"] }
  end

  def teardown
    Excon.stubs.clear
    Excon.defaults[:mock] = false
    %w[MANDRILL_APIKEY HOME].each { |k| ENV[k] = @saved_env[k] }
  end

  # Stub every request, record it, and reply with the given status/body.
  # Registered directly rather than via Excon.stub's block form, which relies
  # on an implicit-block Proc.new in old excon releases (removed in Ruby 3).
  def stub_response(status: 200, body: "{}")
    responder = lambda do |params|
      @requests << params
      { status: status, body: body }
    end
    Excon.stubs.unshift([{}, responder])
  end

  def last_payload
    JSON.parse(@requests.last[:body])
  end
end
