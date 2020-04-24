# frozen_string_literal: true

require 'bundler/setup'
require 'simplecov'
require 'webmock/rspec'
require 'eship'

SimpleCov.start { add_filter '/spec/' }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:all) do
    Eship.base_uri = 'https://app.myeship.co/API/'
    Eship.eship_key = 'Randomkey12x'
  end
end
