class CreateHacknights < ActiveRecord::Migration
  def self.up
    create_table :hacknights do |t|
      t.name :string
      t.time :time
      t.venue :string
      t.timestamps
    end
  end

  def self.down
    drop_table :hacknights
  end
end
