require 'nokogiri'
require 'http'

module OrangePushSMS
  class Message

    BASE_URL     = 'https://api.orangesmspro.sn:8443/api/xml'

    def initialize(options = {})
      @recipients = options.fetch(:recipients, [])
      @content    = options.fetch(:content, '')
      @signature  = options.fetch(:signature, 'Aphia')
      @subject    = options.fetch(:subject, '')
    end

    def config
      OrangePushSMS.configuration
    end

    def timestamp
      @timestamp ||= Time.now.to_i
    end

    def digest
      d = OpenSSL::Digest.new('sha1')
      OpenSSL::HMAC.hexdigest d,
                              config.secret,
                              "#{config.token}#{to_xml}#{timestamp}"
    end

    def to_xml
      @builder ||= Nokogiri::XML::Builder.new do |xml|
        xml.session do
          xml.type 1
          xml.content @content
          xml.recipients do
            @recipients.each do |recipient|
              xml.recipient recipient
            end
          end
          xml.signature @signature
          xml.subject @subject
        end
      end.to_xml
    end

    def send
      uri = "#{BASE_URL}?token=#{config.token}&key=#{digest}&timestamp=#{timestamp}"
      ctx = OpenSSL::SSL::SSLContext.new
      ctx.verify_mode = OpenSSL::SSL::VERIFY_NONE
      xml = Nokogiri::XML HTTP.basic_auth(user: config.user, pass: config.token)
                              .post(uri, body: to_xml, ssl_context: ctx)
      puts xml
    end
  end
end