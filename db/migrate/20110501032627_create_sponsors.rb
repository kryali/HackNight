class CreateSponsors < ActiveRecord::Migration
  def self.up
    create_table :sponsors do |t|
      t.name :string
      t.description :text
      t.company_url :string
      t.logo_url :string
      t.timestamps
    end
  end

  def self.down
    drop_table :sponsors
  end
end
