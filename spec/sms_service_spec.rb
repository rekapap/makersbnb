require 'sms_service'
require 'fake_client'

describe SMSService do
  let(:sms_message) { "Hi John" }
  let(:message) { double :message, sid: 'text' }
  let(:messages) { double :messages, create: message}
  let(:client) { double :client, messages: messages }
  let(:number) { '00000000' }
  subject { described_class.new }

  describe '#send_sms' do
    it 'send an sms' do
      allow(FakeClient).to receive(:new).with(ENV["SMS_sid"],ENV["SMS_token"]).and_return(client)
      expect(messages).to receive(:create).with(from: ENV['SMS_phone'], to: number, body: sms_message)
      subject.send_sms(body: sms_message, to: number)
    end
  end
end
