class CreateSponsors < ActiveRecord::Migration
  def self.up
    create_table :sponsors do |t|
      t.string :name
      t.text :description
      t.string :company_url
      t.string :logo_url
      t.timestamps
    end
  end

  def self.down
    drop_table :sponsors
  end
end
