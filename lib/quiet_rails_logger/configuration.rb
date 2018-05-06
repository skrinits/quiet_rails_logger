module QuietRailsLogger
  class Configuration
    attr_accessor :environments

    def initialize
      @environments = %w[staging production]
    end
  end
end
