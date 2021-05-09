class CreateSaizies < ActiveRecord::Migration[6.1]
  def change
    create_table :saizies do |t|
      t.references :user, null: false, foreign_key: true
      t.name       :string, null: false
      t.place      :string, null: false
      t.title      :string, null: false
      t.content    :text,   null: false 
      t.open       :string, null: false 
      t.close      :string, null: false 
      t.start      :data,   null: false 
      t.finish     :date,   null: false 

      t.timestamps
    end
    add_index :saizies, [:user_id, :created_at]
  end
end
