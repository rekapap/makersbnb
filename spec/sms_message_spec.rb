require 'sms_message'

describe SMSMessage do
  let(:space) {" Castle"}
  let(:date) {"time"}
  let(:booking) { double :booking, space: space, date: date }
  let(:user) { double :user, first_name: 'John' }
  subject { described_class }

  describe '.booking_sent' do
    it 'creates a sms message for booking request' do
      sms_message = subject.booking_sent(user, booking)
      expect(sms_message).to eq("Hi, John! Your booking for #{space} at #{date} has been received. Wait for confimration from the landlord.")
    end
  end
end
