class Hacker < ActiveRecord::Base
  has_many :badges
  has_many :projects
  has_many :skills
end
