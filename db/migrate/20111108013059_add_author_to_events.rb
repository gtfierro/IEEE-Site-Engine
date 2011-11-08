class AddAuthorToEvents < ActiveRecord::Migration
  def change
    add_column :events, :author_id, :integer
  end
end
