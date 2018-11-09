require 'active_record'

class Message < ActiveRecord::Base
  belongs_to :booking
  belongs_to :user
end
