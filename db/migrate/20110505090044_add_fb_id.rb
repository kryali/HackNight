class AddFbId < ActiveRecord::Migration
  def self.up
    add_column :hackers, :fb_id, :string
  end

  def self.down
    remove_column :hackers, :fb_id
  end
end
