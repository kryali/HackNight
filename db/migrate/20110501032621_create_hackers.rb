class CreateHackers < ActiveRecord::Migration
  def self.up
    create_table :hackers do |t|
      t.name :string
      t.image_url :string
      t.timestamps
    end
  end

  def self.down
    drop_table :hackers
  end
end
