class Sponsor < ActiveRecord::Base
  validates :name, :description, :company_url, :logo_url, :presence => true

  belongs_to_many :hacknights
end
