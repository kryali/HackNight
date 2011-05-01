class Badge < ActiveRecord::Base
  belongs_to_many :hackers
  belongs_to_many :projects
end
