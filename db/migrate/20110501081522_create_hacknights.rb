class CreateHacknights < ActiveRecord::Migration
  def self.up
    create_table :hacknights do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :hacknights
  end
end
