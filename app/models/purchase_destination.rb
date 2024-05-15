class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :origin_id, :city, :area_number, :building, :phone, :token

  with_options presence: true,
               format: { with: /\A\d{3}-\d{4}\z/,
                         message: 'Postal code is invalid. Enter it as follows (e.g. 123-4567' } do
    validates :post_code
  end
  validate :post_code_should_be_half_width

  validates :origin_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city,        presence: true
  validates :area_number, presence: true
  validates :phone, presence: true, format: { with: /\A\d{10,11}\z/, message: '10桁以上11桁以内の半角数値を入力してください' }
  validates :token, presence: true

  def save
    purchase = Purchase.create(item_id:, user_id:)
    Destination.create(post_code:, origin_id:, city:, area_number:, building:,
                       phone:, purchase_id: purchase.id)
  end

  private

  def post_code_should_be_half_width
    return if post_code =~ /\A\p{ascii}*\z/

    errors.add(:post_code, 'should be half-width characters')
  end
end