class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :title
      t.string :body
      t.references :user, foreign_key: true, foreign_key: {on_delete: :cascade}
      t.references :club, foreign_key: true, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
