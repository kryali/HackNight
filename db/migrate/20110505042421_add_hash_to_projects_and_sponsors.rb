class AddHashToProjectsAndSponsors < ActiveRecord::Migration
  def self.up
    add_column :projects, :image_hash, :string
    add_column :sponsors, :image_hash, :string
  end

  def self.down
    remove_column :projects, :image_hash
    remove_column :sponsors, :image_hash
  end
end
