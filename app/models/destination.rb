class Destination < ApplicationRecord
  # extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :purchase
end
