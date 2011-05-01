class Hacknight < ActiveRecord::Base
  has_many :projects
  has_many :sponsors
end
