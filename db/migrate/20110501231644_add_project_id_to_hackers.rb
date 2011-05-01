class AddProjectIdToHackers < ActiveRecord::Migration
  def self.up
    add_column :hackers, :project_id, :int
  end

  def self.down
    remove_column :hackers, :proejct_id
  end
end
