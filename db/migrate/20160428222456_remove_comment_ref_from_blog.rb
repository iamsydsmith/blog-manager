class RemoveCommentRefFromBlog < ActiveRecord::Migration
  def change
    remove_reference :blogs, :comment, index: true, foreign_key: true
  end
end
