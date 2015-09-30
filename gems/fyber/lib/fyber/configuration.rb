module Fyber
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
    configuration.validate_attributes
  end

  class Configuration
    attr_accessor :api_key

    def validate_attributes
      unless self.api_key != nil && api_key != ""
        raise NotConfiguredException
      end
    end
  end
end
