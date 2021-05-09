class CreateSaizies < ActiveRecord::Migration[6.1]
  def change
    create_table :saizies do |t|
      t.text :content,    null: false
      t.references :user, null: false, foreign_key: true
      t.string :title,    null: false
      t.string :place,    null: false
      t.string :open,     null: false
      t.string :close,    null: false
      t.date   :start,    null: false
      t.date   :finish,   null: false

      t.timestamps
    end
    add_index :saizies, [:user_id, :created_at]
  end
end
