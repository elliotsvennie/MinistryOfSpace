class City < ActiveRecord::Base
  
  has_many :spaces
  
  acts_as_url :name, url_attribute: :slug, blacklist: ["add"]
  
  geocoded_by :name
  after_validation :geocode
  
  def to_param
    slug
  end
  
end
