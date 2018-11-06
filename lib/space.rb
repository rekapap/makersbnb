require 'active_record'

class Space < ActiveRecord::Base
  has_many :bookings
end
