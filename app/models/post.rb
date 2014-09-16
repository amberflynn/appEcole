class Post < ActiveRecord::Base
	attr_accessor :post_id, :name, :image
	belongs_to :post
	mount_uploader :picture, PictureUploader
	default_scope order('created_at DESC')
end
