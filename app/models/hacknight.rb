class Hacknight < ActiveRecord::Base
  #Validate the event_id
  validates :venue, :event_id, :presence => true

  has_many :projects
  has_many :sponsors
  has_many :hackers
end
