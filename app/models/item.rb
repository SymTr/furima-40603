class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :content, presence: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
end
