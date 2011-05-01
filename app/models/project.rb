class Project < ActiveRecord::Base
  validates :image_url, :name, :description, :presence => true

  has_many :hackers
  has_many :badges
  belongs_to :hacknight
end
