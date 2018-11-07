require 'twilio-ruby'
# require_relative 'sms_message'

class SMSService

  def initialize(number, sms_message_class: SMS_message)
    @sms_message_class = sms_message_class
    @sid = ENV['SMS_sid']
    @token = ENV['SMS_token']
    @number = number
  end

  def send_sms
    message = create_message
    message.sid
  end

  def create_message
    sms_message = @sms_message_class.new.text
    Twilio::REST::Client.new(@sid, @token).messages
      .create(
        body: sms_message,
        from: ENV['SMS_phone'],
        to:  @number
      )
  end
end
