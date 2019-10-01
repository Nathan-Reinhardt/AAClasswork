class ChangeUsers < ActiveRecord::Migration[5.2]
  def change
    change_column(:users, :user_name, :string, null: false)
    change_column(:users, :password_digest, :string, null: false)
    change_column(:users, :session_token, :string, null: false)
    remove_column(:users, :index)

    add_index :users, :user_name, unique: true
  end
end
