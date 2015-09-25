class Space < ActiveRecord::Base
    
  belongs_to :city
  has_many :photos
  
  geocoded_by :address_with_postcode
  after_validation :geocode
  
  acts_as_url :name, url_attribute: :slug, blacklist: ["add", "new", "edit"]
  
  attr_accessor :fixed_desk_price_in_full, :hot_desk_price_in_full
  
  before_validation :clean_twitter_handle
  
  validates :name, presence: true
  validates :address, presence: true
  validates :postcode, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  
  scope :list, ->{ where(is_verified: true) }
  
  def to_param
    slug
  end
  
  def address_with_postcode
    [address, postcode].compact.join("\n")
  end
  
  accepts_nested_attributes_for :photos, 
    reject_if: proc { |a| a["photo"].blank? },
    allow_destroy: true
    
  def fixed_desk_price_in_full
    if fixed_desk_price_in_base.present?
      fixed_desk_price_in_base / 100.0
    else
      nil
    end
  end
  
  def fixed_desk_price_in_full=(pounds)
    if pounds.present?
      self.fixed_desk_price_in_base = (pounds.gsub(/[^0-9\.\-]/, '').to_f * 100).to_i
    else
      nil
    end
  end
  
  def hot_desk_price_in_full
    if hot_desk_price_in_base.present?
      hot_desk_price_in_base / 100.0
    else
      nil
    end
  end
  
  def hot_desk_price_in_full=(pounds)
    if pounds.present?
      self.hot_desk_price_in_base = (pounds.gsub(/[^0-9\.\-]/, '').to_f * 100).to_i
    else
      nil
    end
  end
  
  def clean_twitter_handle
    if self.twitter.present?
      self.twitter = self.twitter.gsub(/https?:\/\/(www\.)?twitter\.com\//, '').gsub("@", "")
    end
  end
  
  def as_json(options={})
    super(only: [:name, :slug, :latitude, :longitude],
      :include => {
        :photos => {:only => [:photo]}
      }
    )
  end
    
end
