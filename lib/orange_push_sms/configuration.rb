module OrangePushSMS
  class Configuration

    attr_accessor :login
    attr_accessor :pass

    def initialize
      @login = ''
      @pass  = ''
    end
  end
end