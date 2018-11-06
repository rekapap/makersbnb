require 'active_record'
require 'bcrypt'
require_relative './database_connection'

class User < ActiveRecord::Base

  def self.create_account(email:, first_name:, last_name:, password:)
    encrypted_password = BCrypt::Password.create(password)
    User.create(email: email, first_name: first_name, last_name: last_name, password: encrypted_password)
  end

  def self.authenticate(email:, password:)
    user = User.find_by_email(email: email)
    return nil if user.nil?
    return unless BCrypt::Password.new(user.password) == password
    user
  end

  private_class_method

  def self.find_by_email(email:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'").first
    return if result.nil?
    User.find(result['id'])
  end
end
