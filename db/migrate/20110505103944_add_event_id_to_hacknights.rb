class AddEventIdToHacknights < ActiveRecord::Migration
  def self.up
    add_column :hacknights, :event_id, :string
  end

  def self.down
    remove_column :hacknights, :event_id
  end
end
