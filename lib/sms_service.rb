require 'twilio-ruby'

class SMSService
  cattr_accessor :client
  self.client = Twilio::REST::Client

  def initialize
    @client = self.class.client.new(
      ENV['SMS_sid'],
      ENV['SMS_token'],
    )
  end

  def send_sms(body:, to:)
    @client.messages.create(from: ENV['SMS_phone'], to: to, body: body).sid
  end
end
