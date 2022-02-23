class CreateUserClubs < ActiveRecord::Migration[5.2]
  def change
    create_table :user_clubs do |t|
      t.references :club, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
