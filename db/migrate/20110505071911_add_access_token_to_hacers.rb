class AddAccessTokenToHacers < ActiveRecord::Migration
  def self.up
    add_column :hackers, :access_token, :string
  end

  def self.down
    remove_column :hackers, :access_token
  end
end
