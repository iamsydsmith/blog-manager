class AddCommentRefToBlog < ActiveRecord::Migration
  def change
    add_reference :blogs, :comment, index: true, foreign_key: true
  end
end
