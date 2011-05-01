class Skill < ActiveRecord::Base
  validates :name, :value, :presence=>true
  belongs_to :hacker
end
