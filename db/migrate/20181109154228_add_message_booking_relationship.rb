class AddMessageBookingRelationship < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :booking_id, :integer
  end
end
