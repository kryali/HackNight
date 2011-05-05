class AddHackerToHacknight < ActiveRecord::Migration
  def self.up
    add_column :hackers, :hacknight_id, :int
  end

  def self.down
    remove_column :hackers, :hacknight_id
  end
end
