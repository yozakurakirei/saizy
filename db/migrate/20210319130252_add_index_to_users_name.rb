class AddIndexToUsersName < ActiveRecord::Migration[6.1]
  def change
    # # nameもユニークにする
    # add_index :users, :name, unique: true
  end
end
