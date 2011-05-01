class Project < ActiveRecord::Base
  has_many :hackers
  has_many :badges
  belongs_to :hacknight
end
