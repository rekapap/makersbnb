require 'sms_service'

describe SMSService do
  let(:sms_message) { "Hi John" }
  let(:message) { double :message, text: sms_message, sid: 'text' }
  let(:messages) { double :messages, create: message }
  let(:client) { double :client, messages: messages }
  let(:number) { '00000000' }
  subject { described_class.new(number, sms_message: sms_message) }

  describe '#send_sms' do
    it 'send an sms' do
      allow(Twilio::REST::Client).to receive(:new).and_return(client)
      expect(message).to receive(:sid)
      subject.send_sms
    end
  end

  describe '#create_message' do

    it 'adds the sms message to client - calling messages' do
      allow(Twilio::REST::Client).to receive(:new).and_return(client)
      expect(client).to receive(:messages)
      subject.create_message
    end

    it 'adds the sms message to client - create message' do
      allow(Twilio::REST::Client).to receive(:new).and_return(client)
      expect(messages).to receive(:create)
      subject.create_message
    end
  end
end
