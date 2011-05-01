class Hacker < ActiveRecord::Base
  validates :name, :email, :presence => true

  has_many :badges
  has_many :projects
  has_many :skills
end
