class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :origin_id, :city, :area_number, :building, :phone, :purchase_id
# あとで上記にtoken たす！！！
  validates :post_code,   presence: true
  validates :origin_id,   presence: true
  validates :city,        presence: true
  validates :area_number, presence: true
  validates :phone,       presence: true
  # validates :token,       presence: true

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Destination.create(post_code: post_code, origin_id: origin_id, city: city, area_number: area_number, building: building, phone: phone, purchase_id: purchase.id)
  end
end