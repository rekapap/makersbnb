class AddForeignKeysToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :user_id, :integer
    add_column :bookings, :space_id, :integer
  end
end
