class AddUserIdToSpaces < ActiveRecord::Migration[5.2]
  def change
    add_column :spaces, :user_id, :integer
  end
end
