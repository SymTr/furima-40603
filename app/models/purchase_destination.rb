class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :item, :user, :post_code, :origin_id, :city, :area_number, :building_name, :phone, :purchase

  validates :post_code,   presence: true
  validates :origin_id,   presence: true
  validates :city,        presence: true
  validates :area_number, presence: true
  validates :phone,       presence: true
  # validates :token,       presence: true

  def save
  
    purchase = Purchase.create(item: item, user_id: user_id)
    
    Address.create(post_code: post_code, origin_id: origin_id, city: city, area_number: area_number, phone: phone)
  end
end