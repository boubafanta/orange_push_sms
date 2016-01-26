require 'spec_helper'


describe OrangePushSMS do
  describe "#configure" do
    before do
      OrangePushSMS.configure do |config|
        config.login = '*******'
        config.pass  = '*******'
      end
    end

    it 'sends an sms' do
      message = OrangePushSMS::Message.new msisdn: '221775555555', wording: 'A texte message', tpoa: 'orange_push_sms', is_xml: true
      response = message.send
      puts "Message is sent ? - #{response}"
    end

  end
end
