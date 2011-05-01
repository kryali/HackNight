class Badge < ActiveRecord::Base
  validates :name, :image, :description, :presence => true
end
