class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :content, presence: true

  # ***************************************************
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id

  validates :title, :text, presence: true
  validates :genre_id, numericality: { other_than: 1, message: "can't be blank"} 
end
