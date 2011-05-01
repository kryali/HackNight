class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :project_url
      t.string :image_url
      t.integer :votes
      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
