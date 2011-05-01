class Sponsor < ActiveRecord::Base
  validates :name, :description, :company_url, :logo_url, :presence => true

  has_and_belongs_to_many :hacknights
end
