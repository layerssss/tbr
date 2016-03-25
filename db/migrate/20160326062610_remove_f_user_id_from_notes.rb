class RemoveFUserIdFromNotes < ActiveRecord::Migration
  def change
    remove_column :notes, :f_user_id, :string
  end
end
