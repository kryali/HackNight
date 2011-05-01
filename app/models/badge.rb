class Badge < ActiveRecord::Base
  validates :name, :image, :description, :presence => true

  belongs_to_many :hackers
  belongs_to_many :projects
end
