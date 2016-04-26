class AddPhotoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_photo, :string
  end
end
