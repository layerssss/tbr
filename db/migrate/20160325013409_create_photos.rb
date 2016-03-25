class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :thumbnail
      t.string :url
      t.datetime :time
      t.string :f_id

      t.timestamps null: false
    end
  end
end
