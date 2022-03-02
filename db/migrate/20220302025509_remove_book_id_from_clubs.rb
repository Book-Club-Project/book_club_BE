class RemoveBookIdFromClubs < ActiveRecord::Migration[5.2]
  def change
    remove_column :clubs, :book_id, :integer
  end
end
