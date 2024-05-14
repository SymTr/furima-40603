class Purchase < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :destination
  belongs_to :user
  belongs_to :item
  accepts_nested_attributes_for :destination
end
