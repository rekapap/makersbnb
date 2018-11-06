require 'active_record'

class User < ActiveRecord::Base
  has_many :booking_requests, foreign_key: "user_id", class_name: "Booking"
  has_many :spaces
  has_many :bookings, through: :spaces
end
