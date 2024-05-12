class Purchase < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # - has_one :destination（後で使うのでコメントアウトします）
  belongs_to :user
  belongs_to :item
end
