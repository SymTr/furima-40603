class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_date
  belongs_to :freight
  belongs_to :origin

  has_one :purchase
  has_one_attached :image
  
  validates :image, presence: true
  validates :category_id, :condition_id, :freight_id, :origin_id, :delivery_date_id,
            numericality: { other_than: 1, message: "can't be blank" }

  validates :item_name, presence: true, length: { maximum: 40 }
  validates :item_detail, presence: true, length: { maximum: 1000 }

  validates :price, presence: true
  validates :price, numericality: { only_integer: true, message: 'Use half-width numbers' }, if: Proc.new { |a| a.price.present? }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'should be ¥300~¥9,999,999' }, if: Proc.new { |a| a.price.present? && a.price.to_s =~ /\A[0-9]+\z/ }
end