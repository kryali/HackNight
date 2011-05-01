class AddEmailToHackers < ActiveRecord::Migration
  def self.up
    add_column :hackers, :email, :string
  end

  def self.down
    remove_column :hackers, :email
  end
end
