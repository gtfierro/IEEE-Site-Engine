class CreateSignups < ActiveRecord::Migration
  def self.up
    create_table :signups do |t|
      t.integer :user_id
      t.integer :event_id
      t.string :role

      t.timestamps
    end
  end

  def self.down
    drop_table :signups
  end
end
