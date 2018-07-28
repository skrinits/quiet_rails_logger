require 'test_helper'

class QuietRailsLogger::ConfigurationTest < ActiveSupport::TestCase
  test 'default environments' do
    assert_equal %w[staging production], QuietRailsLogger.configuration.environments
  end

  test 'setting environment' do
    QuietRailsLogger.configure do |config|
      config.environments = %w[test]
    end

    assert_equal %w[test], QuietRailsLogger.configuration.environments
  end
end
