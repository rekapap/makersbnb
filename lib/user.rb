require 'active_record'
require 'bcrypt'

class User < ActiveRecord::Base
  has_many :booking_requests, foreign_key: "user_id", class_name: "Booking"
  has_many :spaces
  has_many :bookings, through: :spaces

  def self.create_account(email:, first_name:, last_name:, password:, phone_number:)
    return unless User.where(email: email).first.nil?
    encrypted_password = BCrypt::Password.create(password)
    User.create(email: email, first_name: first_name, last_name: last_name,
                password: encrypted_password,
                phone_number: phone_number)
  end

  def self.authenticate(email:, password:)
    user = User.where(email: email).first
    return nil if user.nil?
    return nil unless BCrypt::Password.new(user.password) == password
    user
  end
end
