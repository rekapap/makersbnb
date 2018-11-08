class SMSMessage

  def self.booking_sent(user, booking)
    "Hi, #{user.first_name}! Your booking for #{booking.space} on"\
    " #{booking.date} has been received. Wait for confirmation from the landlord."
  end

  def self.booking_confirmed(user, booking)
    "Hi, #{user.first_name}! Your booking for #{booking.space} on"\
    " #{booking.date} was confirmed."
  end

  def self.booking_rejected(user, booking)
    "Hi, #{user.first_name}! Your booking for #{booking.space} on"\
    " #{booking.date} was not accepted."
  end

end
