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
	config.login = 'LOGIN'
	config.pass  = 'PASSWORD'
end
```

## Usage

To send an SMS to single recipient use:

```ruby
message = OrangePushSMS::Message.new msisdn: '22177XXXXXXX', wording: 'Your message here', tpoa: 'SENDER', is_xml: true
message.send #returns true if successful 
```
To multiple recipients

```ruby
message = OrangePushSMS::Message.new numbers: ['22177XXXXXXX', '22177YYYYYYY', '22176ZZZZZZZ'], wording: "Sending to multiple recipients", tpoa: 'SENDER'
message.send
```

## Contributing

1. Fork it ( https://github.com/divinwind/orange_push_sms/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
