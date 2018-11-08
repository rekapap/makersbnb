# class SMSService
#   cattr_accessor :client
#   self.client = Twilio::REST::Client

#   def initialize
#     @client = self.class.client.new(
#       ENV.fetch("SMS_SID"),
#       ENV.fetch("SMS_TOKEN"),
#     )
#   end

#   def send_sms(body:, to: to)
#     @client.create(from: ENV['SMS_phone'], to: to, body:body)
#   end
# end

# spec_helper.rb

# SMSService.client = FakeClient

# RSpec.configure do |config|
#   config.before :each, type: :feature do
#     FakeClient.messages = []
#   end
# end

# class FakeClient
#   Message = Struct.new(:from, :to, :body)

#   cattr_accessor :messages
#   self.messages = []

#   def initialize(_account_sid, _auth_token)
#   end

#   def messages
#     self
#   end

#   def create(from:, to:, body:)
#     self.class.messages << Message.new(from: from, to: to, body: body)
#   end
# end
