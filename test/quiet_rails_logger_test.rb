require 'test_helper'

class QuietRailsLogger::Test < ActiveSupport::TestCase
  test 'unsubscribe' do
    ActiveSupport::Subscriber.subscribers.each do |subscriber|
      subscriber.patterns.each do |pattern|
        assert_not(ActiveSupport::Notifications.notifier.listening?(pattern))
      end
    end
  end
end
