class RemoveBlogRefFromComment < ActiveRecord::Migration
  def change
    remove_reference :comments, :blog, index: true, foreign_key: true
  end
end
