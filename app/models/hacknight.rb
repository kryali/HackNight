class Hacknight < ActiveRecord::Base
  validates :venue, :presence => true

  has_many :projects
  has_many :sponsors
end
