require 'sms_message'

describe SMSMessage do
  let(:description) { "Castle" }
  let(:space) { double :space, description: description }
  let(:date) {"time"}
  let(:booking) { double :booking, space: space, date: date }
  let(:user) { double :user, first_name: 'John' }
  subject { described_class }

  describe '.booking_sent' do
    it 'creates a sms message for booking request' do
      sms_message = subject.booking_sent(user, booking)
      expect(sms_message).to eq("Hi, John! Your booking for #{description} on #{date} has been received. Wait for confirmation from the landlord.")
    end
  end
  describe '.booking_confirmed' do
    it 'creates a sms message for booking comfirmation' do
      sms_message = subject.booking_confirmed(user, booking)
      expect(sms_message).to eq("Hi, John! Your booking for #{description} on #{date} was confirmed.")
    end
  end
  describe '.booking_rejected' do
    it 'creates a sms message for booking rejection' do
      sms_message = subject.booking_rejected(user, booking)
      expect(sms_message).to eq("Hi, John! Your booking for #{description} on #{date} was not accepted.")
    end
  end
end
