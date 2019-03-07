class RemoveUserPicFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :user_pic, :string
  end
end
