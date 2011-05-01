class Hacker < ActiveRecord::Base
  validates :name, :email, :presence => true

  has_and_belongs_to_many :badges
  has_many :projects
  has_many :skills
end
