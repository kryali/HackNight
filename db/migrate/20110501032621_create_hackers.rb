class CreateHackers < ActiveRecord::Migration
  def self.up
    create_table :hackers do |t|
      t.string :name
      t.string :image_url
      t.timestamps
    end
  end

  def self.down
    drop_table :hackers
  end
end
