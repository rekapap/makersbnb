class AddUserIdAndTimestampToMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :user_id, :integer
    add_column :users, :created_at, :datetime#, null: false
  end
end
