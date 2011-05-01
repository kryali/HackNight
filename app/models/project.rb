class Project < ActiveRecord::Base
  validates :image_url, :name, :description, :presence => true
  validates_format_of :image_url, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix
  

  def validate_url
    if :image_url.match(/\.(jpg|png|gif)/)
      return true
    else
      return false
    end
  end

  has_many :hackers
  has_and_belongs_to_many :badges
  belongs_to :hacknight
end
