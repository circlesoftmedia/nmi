class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  include Rails.application.routes.url_helpers
  mount_uploader :image, ImageUploader
  
end
