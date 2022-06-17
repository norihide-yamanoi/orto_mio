class ChangeColumnsToBlogs < ActiveRecord::Migration[6.0]
  def change
    change_column_null :blogs, :title, false
    change_column_null :blogs, :content, false
  end
end
