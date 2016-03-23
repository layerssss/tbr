class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.integer :continent_id
      t.text :flag

      t.timestamps null: false
    end
  end
end
