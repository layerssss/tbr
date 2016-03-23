class CreateContinents < ActiveRecord::Migration
  def change
    create_table :continents do |t|
      t.string :name
      t.text :flag

      t.timestamps null: false
    end
  end
end
