class ChangePostsContentLength < ActiveRecord::Migration
  def up
    change_column :posts, :content, :text, :limit => 65535
  end

  def down
    change_column :posts, :content, :text, :limit => nil
  end
end
