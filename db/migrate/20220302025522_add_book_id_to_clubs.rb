class AddBookIdToClubs < ActiveRecord::Migration[5.2]
  def change
    add_column :clubs, :book_id, :string
  end
end
