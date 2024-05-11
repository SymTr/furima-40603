class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_date
  belongs_to :freight
  belongs_to :origin

  has_one_attached :image

  validates :item_name, :item_detail, :category_id, :condition_id, :delivery_date_id, :freight_id, :origin_id, :price, presence: true
  validates :category_id, :condition_id, :delivery_date_id, :freight_id, :origin_id, numericality: { other_than: 1, message: "can't be blank"}

end