module OrangePushSMS
  class Configuration

    attr_accessor :user, :token, :secret

    def initialize
      @user   = ''
      @token  = ''
      @secret = ''
    end
  end
end