require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
  before do
    # Setup your object for testing
    @purchase_destination = FactoryBot.build(:purchase_destination)
  end
 
  context '有効な情報が入力された場合' do
    it "tokenが存在するのであれば保存が可能であること" do
      expect(@purchase_destination).to be_valid
    end
end

context '無効な情報が入力された場合' do
    it "tokenが空白では保存ができないこと" do
      @purchase_destination.token = nil
      @purchase_destination.valid?
      expect(@purchase_destination.errors.full_messages).to include("Token can't be blank")
    end
end
  

end