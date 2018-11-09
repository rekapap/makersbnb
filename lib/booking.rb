require 'active_record'

class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :space
  has_many :messages
end
