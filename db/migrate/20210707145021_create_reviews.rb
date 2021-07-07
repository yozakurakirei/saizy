class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :saizy, foreign_key: true
      t.string :comment
      t.float :rate
      t.string :title

      t.timestamps
    end
  end
end
