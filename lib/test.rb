# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'

# Your Account Sid and Auth Token from twilio.com/console
account_sid = 'AC30110a88bf8c2cdf88affabafc389553'
auth_token = 'your_auth_token'
@client = Twilio::REST::Client.new(account_sid, auth_token)

@client.messages.create(
                             from: '+15017122661',
                             body: 'body',
                             to: '+15558675310'
                           ).sid


