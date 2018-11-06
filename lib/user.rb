require 'active_record'
require 'bcrypt'
require_relative './database_connection'

class User < ActiveRecord::Base

  def self.find_by_email(email:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = #{email};")
    return if result.nil?
    User.find(id: result[0]['id'])
  end


  def self.authenticate(email:, password:)
  user = User.find_by_email(email)
    return nil if user.nil?
    return unless BCrypt::Password.new(user.password) == password
    user
  end

end
