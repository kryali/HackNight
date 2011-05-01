class CreateHacknights < ActiveRecord::Migration
  def self.up
    create_table :hacknights do |t|
      t.string :name
      t.time :time
      t.string :venue
      t.timestamps
    end
  end

  def self.down
    drop_table :hacknights
  end
end
