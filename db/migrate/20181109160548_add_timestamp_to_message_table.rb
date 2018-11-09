class AddTimestampToMessageTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :created_at
    add_column :messages, :created_at, :datetime#, null: false
  end
end
