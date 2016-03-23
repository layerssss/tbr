class CreateStays < ActiveRecord::Migration
  def change
    create_table :stays do |t|
      t.integer :country_id
      t.string :name
      t.date :arrival
      t.integer :days

      t.timestamps null: false
    end
    add_index :stays, :country_id
  end
end
