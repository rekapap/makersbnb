class CreateSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :spaces do |t|
      t.string :description
      t.decimal :price
    end
  end
end
