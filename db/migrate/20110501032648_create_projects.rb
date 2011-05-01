class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.name :string
      t.description :text
      t.project_url :string
      t.image_url :string
      t.votes :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
