class AddImpressionsCountToSaizies < ActiveRecord::Migration[6.1]
  def change
    add_column :saizies, :impressions_count, :integer, default: 0
  end
end
