class Space < ActiveRecord::Base
  
  has_many :photos
  
  geocoded_by :address
  after_validation :geocode
  
  acts_as_url :name, url_attribute: :slug, blacklist: ["add"]
  
  attr_accessor :price_in_pounds
  
  before_validation :clean_twitter_handle
  
  validates :name, presence: true
  validates :address, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  validates :price_in_pounds, presence: true
  validates :desk_type, presence: true, inclusion: %w{fixed hotdesk}
  
  scope :list, ->{ where(is_verified: true) }
  
  def to_param
    slug
  end
  
  accepts_nested_attributes_for :photos, 
    reject_if: proc { |a| a["photo"].blank? },
    allow_destroy: true
    
  def price_in_pounds
    if price_in_pence.present?
      price_in_pence / 100.0
    else
      nil
    end
  end
  
  def price_in_pounds=(pounds)
    if pounds.present?
      self.price_in_pence = (pounds.gsub(/[^0-9\.\-]/, '').to_f * 100).to_i
    else
      nil
    end
  end
  
  def clean_twitter_handle
    if self.twitter.present?
      self.twitter = self.twitter.gsub(/https?:\/\/(www\.)?twitter\.com\//, '').gsub("@", "")
    end
  end
  
end
