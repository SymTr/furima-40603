require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
 describe '商品購入情報保存と決済' do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_destination = FactoryBot.build(:purchase_destination, user_id: @user.id, item_id: @item.id)
  end
    context '内容に問題ない場合' do
      it "すべての値が正しく入力されていれば保存できること" do
        expect(@purchase_destination).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_destination.building = nil
        expect(@purchase_destination).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it "post_codeが空では保存ができないこと" do
        @purchase_destination.post_code = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeは『3桁ハイフン4桁』半角英数字でないと保存できないこと' do
        @purchase_destination.post_code = '123-123４'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Post code 無効な郵便番号です。次のように入力してください (例: 123-4567)")
      end
      it "origin_idに「---」が選択されている場合は購入できないこと'" do
        @purchase_destination.origin_id = 1
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Origin can't be blank")
      end
      it "area_numberが空では保存ができないこと" do
        @purchase_destination.area_number = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Area number can't be blank")
      end
      it "phoneが空では保存ができないこと" do
        @purchase_destination.phone = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone can't be blank")
      end
      it "電話番号が9桁以下だと購入できないこと" do
        @purchase_destination.phone = "01234567" # 8桁
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone 10桁以上11桁以内の半角数値を入力してください")
      end
      it "電話番号が12桁以上だと購入できないこと" do
        @purchase_destination.phone = "0123456789012" # 13桁
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone 10桁以上11桁以内の半角数値を入力してください")
      end
      it "phoneがハイフンを含むと保存できないこと" do
        @purchase_destination.phone = "090-1234-5678"
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone 10桁以上11桁以内の半角数値を入力してください")
      end
      it '電話番号が半角数値でないと購入できないこと' do
        @purchase_destination.phone = '0901234123４'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone 10桁以上11桁以内の半角数値を入力してください")
      end
       it "tokenが空では保存ができないこと" do
        @purchase_destination.token = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが紐付いていないと保存できないこと' do
        @purchase_destination.user_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが紐付いていないと保存できないこと' do
        @purchase_destination.item_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end