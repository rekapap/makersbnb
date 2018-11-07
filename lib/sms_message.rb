class SMSMessage

  def self.booking_sent(user, booking)
    "Hi, #{user.first_name}! Your booking for #{booking.space} at"\
    " #{booking.date} has been received. Wait for confimration from the landlord."
  end
end
