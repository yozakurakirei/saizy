class AddIndexToUsersEmail < ActiveRecord::Migration[6.1]
  def change
    # email ユニーク
    add_index :users, :email, unique: true
  end
end
