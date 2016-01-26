require 'nokogiri'
require 'http'

module OrangePushSMS
  class Message

    BASE_URL     = 'https://gsm.orange.sn/push_flux/http.php'
    BASE_URL_XML = 'http://213.154.64.47/push_flux/xml.php'

    def initialize(options = {})
      @msisdn   = options.fetch(:msisdn, '221770000000')
      @wording  = options.fetch(:wording, '')
      @tpoa     = options.fetch(:tpoa, 'Aphia')
      @numbers  = options.fetch(:numbers, [])
      @is_xml   = options.has_key?(:is_xml) and options.delete(:is_xml)
      @campaign = 'TESTPUSH'
    end

    def send
      if @is_xml or @numbers.size > 0
        xml = Nokogiri::XML HTTP.post( BASE_URL_XML, form: {xml: to_xml}).to_s
        xml.xpath("//STATUS_CODE").first.text == "100"
      else
        !(/Return:1/ =~ HTTP.get(BASE_URL, params: to_h).to_s).nil?
      end
    end

    def to_h
      pass = Digest::MD5.hexdigest(OrangePushSMS.configuration.pass)
      {login: OrangePushSMS.configuration.login,
       pass: pass,
       tpoa: @tpoa,
       msisdn: @msisdn,
       wording: @wording,
       campaign: @campaign}
    end

    def to_xml
      pass = Digest::MD5.hexdigest(OrangePushSMS.configuration.pass)
      builder = Nokogiri::XML::Builder.new do |xml|
        xml.SESSION(login: OrangePushSMS.configuration.login, pass: pass) do
          xml.CREATE do
            xml.CAMPAIGN(type: '3') do
              xml.NAME @campaign
              xml.START DateTime.now.strftime('%Y-%m-%d-%H-%M')
              xml.END DateTime.now.strftime('%Y-%m-%d-%H-%M')
              xml.TPOA @tpoa
              if @numbers.size > 0
                xml.GEN do
                  xml.WORDING @wording
                  xml.NUMBERS do
                    @numbers.each do |number|
                      xml.NUMBER number
                    end
                  end
                end
              else
                xml.PERSO do
                  xml.MESSAGE do
                    xml.NUMBER @msisdn
                    xml.WORDING @wording
                  end
                end
              end
            end
          end
        end
      end
      builder.to_xml
    end
  end
end