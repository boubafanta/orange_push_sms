require 'orange_push_sms/version'
require 'orange_push_sms/configuration'
require 'orange_push_sms/message'
require 'digest'
require 'nokogiri'
require 'http'

module OrangePushSMS

  class << self
    attr_accessor :configuration
  end

  def self.configure
    yield(configuration)
  end

  def self.configuration
    @configuration ||= Configuration.new
  end
end
