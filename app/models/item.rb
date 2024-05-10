class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :category_id
  belongs_to :condition_id
  belongs_to :delivery_date_id
  belongs_to :freight_id
  belongs_to :origin_id

  has_one_attached :image

  validates :content, :title, :text, :category_id, :condition_id, :delivery_date_id, :freight_id, :origin_id, presence: true
  validates :category_id, :condition_id, :delivery_date_id, :freight_id, :origin_id, numericality: { other_than: 1, message: "can't be blank"}

end
