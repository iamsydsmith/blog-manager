class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title, null: false
      t.string :photo, null: false
      t.text :post, null: false

      t.timestamps null: false
    end
  end
end
