class AddNameToSaizies < ActiveRecord::Migration[6.1]
  def change
    add_column :saizies, :name, :string, null: false
  end
end
