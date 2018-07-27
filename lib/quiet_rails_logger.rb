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
      if Rails.env.in?(QuietRailsLogger.configuration.environments)
        ActiveSupport.on_load(:after_initialize) do
          ActiveSupport::Subscriber.subscribers.each do |subscriber|
            subscriber.patterns.each do |pattern|
              ActiveSupport::Notifications.unsubscribe(pattern)
            end
          end
        end

        app.middleware.delete Rails::Rack::Logger
      end
    end
  end
end
