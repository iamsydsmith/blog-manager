class AddUserReferenceToComment < ActiveRecord::Migration
  def change
    add_reference :comments, :user, index: true, foreign_key: true, null:false
  end
end
