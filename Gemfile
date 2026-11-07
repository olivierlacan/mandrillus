# frozen_string_literal: true

source "https://rubygems.org"

gemspec

# Unpinned so Bundler can pick versions that still run on old Rubies.
gem "minitest", ">= 5.0"
gem "rake"

# CI can pin excon to check the oldest/newest versions the gemspec allows,
# e.g. EXCON_VERSION="~> 0.16.0" bundle install
gem "excon", ENV["EXCON_VERSION"] unless ENV.fetch("EXCON_VERSION", "").empty?
