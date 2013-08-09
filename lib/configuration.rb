require 'yaml'

class Configuration
  def [](key)
    config.fetch(key, ENV[key])
  end

  private

  def config
    @config ||= YAML.load_file(config_file_location) || {}
  end

  def config_file_location
    env = ENV['RACK_ENV'] || Rails.env
    File.join(__dir__, "../config/#{env}.yml")
  end
end
