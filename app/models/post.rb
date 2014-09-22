class Post < ActiveRecord::Base
  has_many :pictures, dependent: :destroy

  accepts_nested_attributes_for :pictures

  validates :name,  :presence => true
  validates :title, :presence => true

  default_scope order('created_at DESC')
end
