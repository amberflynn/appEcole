class Picture < ActiveRecord::Base
  mount_uploader :picture, ImageUploader
  belongs_to :post
end