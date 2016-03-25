class AddFromToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :from, :string
  end
end
