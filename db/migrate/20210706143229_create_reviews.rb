class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :saizy, null: false, foreign_key: true
      t.string :rate, null: false, default: 0
      t.text   :comment, null: false

      t.timestamps
    end
  end
end
