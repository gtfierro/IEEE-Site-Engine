class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :title
      t.string :location
      t.string :description
      t.datetime :event_start
      t.datetime :event_end

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
