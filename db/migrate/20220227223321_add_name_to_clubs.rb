class AddNameToClubs < ActiveRecord::Migration[5.2]
  def change
    add_column :clubs, :name, :string
  end
end
