class AddColumnsToSaizies < ActiveRecord::Migration[6.1]
  def change
    add_column :saizies, :latitude, :float
    add_column :saizies, :longitude, :float
  end
end
