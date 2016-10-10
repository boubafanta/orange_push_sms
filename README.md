# OrangePushSMS

This is a gem written to send SMS through Orange Senegal API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'orange_push_sms'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install orange_push_sms

## Configuration

In config/initializers create a file orange_push_sms.rb:

```ruby
OrangePushSMS.configure do |config|
	config.user   = 'LOGIN'
	config.token  = 'TOKEN'
	config.secret = 'API KEY'
end
```

## Usage

To send an SMS :

```ruby
message = OrangePushSMS::Message.new recipients: ['22177XXXXXXX'], content: 'Your message here', signature: 'SENDER', subject: 'Subject'
message.send #returns true if successful 
```
## Contributing

1. Fork it ( https://github.com/divinwind/orange_push_sms/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
