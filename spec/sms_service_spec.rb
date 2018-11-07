require 'sms_service'

describe SMSService do
  let(:sms_mess) { double :sms_mess, text: "Thank you! Your order was placed", sid: 'sent' }
  let(:sms_mess_class) { double :sms_mess_class, new: sms_mess }
  let(:messages) { double :messages, create: sms_mess }
  let(:client) { double :client, messages: messages }
  let(:number) { '00000000' }
  subject { described_class.new(number, sms_message_class: sms_mess_class) }

  describe '#send_sms' do
    it 'send an sms' do
      allow(Twilio::REST::Client).to receive(:new).and_return(client)
      expect(sms_mess).to receive(:sid)
      subject.send_sms
    end
  end

  describe '#create_message' do
    it 'creates a new sms message object' do
      allow(Twilio::REST::Client).to receive(:new).and_return(client)
      expect(sms_mess_class).to receive(:new)
      subject.create_message
    end

    it 'creates a sms message' do
      allow(Twilio::REST::Client).to receive(:new).and_return(client)
      expect(sms_mess).to receive(:text)
      subject.create_message
    end

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
