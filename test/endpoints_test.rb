# frozen_string_literal: true

require "test_helper"

# Calls every public endpoint method with placeholder arguments to make sure
# each one builds a valid request on the current Ruby/excon combination.
class EndpointsTest < MandrillTest
  GROUPS = %i[
    templates exports users rejects inbound tags messages whitelists ips
    subaccounts urls webhooks senders metadata
  ].freeze
  # Mandrill::Internal (api.internal) has no public endpoints, so it is skipped.

  def test_every_endpoint_builds_a_request
    stub_response(body: "{}")
    api = Mandrill::API.new("k")
    calls = 0

    GROUPS.each do |group|
      client = api.public_send(group)
      endpoints = client.class.public_instance_methods(false) - %i[master master=]
      refute_empty endpoints, "#{group} exposes no endpoints"

      endpoints.each do |name|
        required = client.method(name).parameters.count { |type, _| type == :req }
        client.public_send(name, *Array.new(required, "x"))
        calls += 1

        path = @requests.last[:path]
        assert_match %r{\A/api/1\.0/[a-z-]+/[a-z0-9-]+\.json\z}, path, "#{group}.#{name}"
        assert_equal "k", last_payload["key"], "#{group}.#{name}"
      end
    end

    source = File.read(File.expand_path("../lib/mandrill/api.rb", __dir__))
    assert_equal source.scan("@master.call").size, calls, "every endpoint should be exercised"
  end
end
