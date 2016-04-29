class AddBlogReferenceToComment < ActiveRecord::Migration
  def change
    add_reference :comments, :blog, index: true, foreign_key: true, null:false
  end
end
