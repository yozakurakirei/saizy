class AddStatusToSaizies < ActiveRecord::Migration[6.1]
  def change
    add_column :saizies, :status, :integer, default: 0, null: false
  end
end
