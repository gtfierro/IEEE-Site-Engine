class AddFieldsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :name, :string
    add_column :users, :year, :integer
    add_column :users, :position, :string

  end

  def self.down
    remove_column :users, :position
    remove_column :users, :year
    remove_column :users, :name
  end
end
