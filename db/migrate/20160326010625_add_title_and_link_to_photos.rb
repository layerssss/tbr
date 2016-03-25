class AddTitleAndLinkToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :title, :string
    add_column :photos, :link, :string
  end
end
