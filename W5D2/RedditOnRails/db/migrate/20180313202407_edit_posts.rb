class EditPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :sub_id
    add_index :posts, :user_id
    change_column_null :posts, :title, false

    add_index :subs, :moderator_id
    change_column_null :subs, :title, false
    change_column_null :subs, :description, false

    change_column_null :users, :username, false
    change_column_null :users, :password_digest, false
    add_index :users, :username
    add_column :users, :session_token, :string
    change_column_null :users, :session_token, false
    remove_column :users, :session_digest

  end
end
