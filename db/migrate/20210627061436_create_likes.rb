class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :saizy, foreign_key: true

      t.timestamps
      t.index [:user_id, :saizy_id], unique: true
    end
  end
end
