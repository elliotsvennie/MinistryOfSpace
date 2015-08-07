class Photo < ActiveRecord::Base
  
  belongs_to :space
  
  mount_uploader :photo, SpacePhotoUploader
  
end
