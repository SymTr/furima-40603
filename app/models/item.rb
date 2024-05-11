class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_date
  belongs_to :freight
  belongs_to :origin

  has_one_attached :image

  validates :image, :category_id, :condition_id, :delivery_date_id, :freight_id, :origin_id, presence: true
  validates :category_id, :condition_id, :freight_id, :origin_id, :delivery_date_id, numericality: { other_than: 1, message: "can't be blank"}
  
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: 'Use half-width numbers' }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "should be ¥300~¥9,999,999" }
  
  validates :item_name, presence: true, length: { maximum: 40 }
  validates :item_detail, presence: true, length: { maximum: 1000 }

end