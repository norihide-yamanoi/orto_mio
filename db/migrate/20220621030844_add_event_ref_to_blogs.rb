class AddEventRefToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_reference :blogs, :event, null: false, foreign_key: true
  end
end
