class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :origin_id, :city, :area_number, :building, :phone, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :city
    validates :area_number
    validates :phone, format: { with: /\A\d{10,11}\z/, message: '10桁以上11桁以内の半角数値を入力してください' }
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: '無効な郵便番号です。次のように入力してください (例: 123-4567)' }
    validates :token
  end

  validates :origin_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchase = Purchase.create(user_id:, item_id:)
    Destination.create(post_code:, origin_id:, city:, area_number:, building:,
                       phone:, purchase_id: purchase.id)
  end
end
