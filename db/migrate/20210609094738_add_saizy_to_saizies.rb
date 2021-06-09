class AddSaizyToSaizies < ActiveRecord::Migration[6.1]
  def change
    add_column :saizies, :area, :integer, default: 0, null: false
  end
end
