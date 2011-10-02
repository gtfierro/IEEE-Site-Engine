class ChangePostsContentLength < ActiveRecord::Migration
  def up
    change_column :posts, :content, :text
  end

  def down
    change_column :posts, :content, :text, :limit => nil
  end
end
