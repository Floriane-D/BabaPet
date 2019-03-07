class RemoveLocationPicFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :location_pic, :string
  end
end
