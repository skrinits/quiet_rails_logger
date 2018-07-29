require 'quiet_rails_logger/configuration'

module QuietRailsLogger
  class << self
    def configuration
      @configuration ||= QuietRailsLogger::Configuration.new
    end

    def configure
      yield(configuration)
    end
  end

  class Engine < ::Rails::Engine
    initializer 'quiet_rails_logger.skip_info_messages' do |app|
      unsubscribe = lambda do
        ActiveSupport::Subscriber.subscribers.each do |subscriber|
          next unless subscriber.class.name =~ /LogSubscriber/

          subscriber.patterns.each do |pattern|
            ActiveSupport::Notifications.unsubscribe(pattern)
          end
        end
      end

      if Rails.env.in?(QuietRailsLogger.configuration.environments) || ENV['GEM'] == 'true'
        ActiveSupport.on_load(:after_initialize) { unsubscribe.call }
        ActiveSupport.on_load(:active_job) { unsubscribe.call }
        ActiveSupport.on_load(:active_record) { unsubscribe.call }

        app.middleware.delete Rails::Rack::Logger
      end
    end
  end
end
