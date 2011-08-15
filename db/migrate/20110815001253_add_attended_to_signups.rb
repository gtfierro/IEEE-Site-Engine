class AddAttendedToSignups < ActiveRecord::Migration
  def self.up
    add_column :signups, :attended, :boolean
  end

  def self.down
    remove_column :signups, :attended
  end
end
