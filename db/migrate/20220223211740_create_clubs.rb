class CreateClubs < ActiveRecord::Migration[5.2]
  def change
    create_table :clubs do |t|
      t.integer :host_id
      t.integer :book_id

      t.timestamps
    end
  end
end
