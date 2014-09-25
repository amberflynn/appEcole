class Post < ActiveRecord::Base
  has_many :pictures, dependent: :destroy

  accepts_nested_attributes_for :pictures

  scope :sort_by_newest, -> { order('created_at DESC') }
end
