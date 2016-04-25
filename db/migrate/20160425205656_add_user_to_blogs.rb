class AddUserToBlogs < ActiveRecord::Migration
  def change
    add_reference :blogs, :user, index: true, foreign_key: true, null:false
  end
end
