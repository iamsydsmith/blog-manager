class RemovePhotoFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :user_photo, :string
  end
end
