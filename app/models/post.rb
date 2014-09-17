class Post < ActiveRecord::Base
  has_many :pictures, dependent: :destroy

  accepts_nested_attributes_for :pictures

  default_scope order('created_at DESC')
end
