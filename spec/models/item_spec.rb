require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品投稿' do
    context '出品が投稿できる場合' do
      it 'image,item_name,item_detailとpriceは¥300〜¥9,999,999であれば保存できる' do
        @item = FactoryBot.create(:item)
        expect(@item).to be_valid
      end
    end
    context 'メッセージが投稿できない場合' do
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空では保存できない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_detailが空では保存できない' do
        @item.item_detail = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item detail can't be blank")
      end
      it 'priceが空では保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'item_nameが41文字以上では保存できない' do
        @item.item_name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include('Item name is too long (maximum is 40 characters)')
      end
      it 'item_detailが1001文字以上では保存できない' do
        @item.item_detail = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include('Item detail is too long (maximum is 1000 characters)')
      end
      it 'priceは¥300〜¥9,999,999の間でなければ保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price should be ¥300~¥9,999,999')
      end
      it 'priceは¥300〜¥9,999,999の間でなければ保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price should be ¥300~¥9,999,999')
      end
      it 'priceに半角数字以外が含まれている場合は出品できない' do
        @item.price = '111c'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Use half-width numbers')
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.freight_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Freight can't be blank")
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.origin_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Origin can't be blank")
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end
    end
  end
end
