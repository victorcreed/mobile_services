class Widget < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  attr_accessible :image, :url, :posted_at, :content_type, :banned
end
