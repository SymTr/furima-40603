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
          expect(@item.errors.full_messages).to include("Price should be ¥300~¥9,999,999")
      end
      it 'priceは¥300〜¥9,999,999の間でなければ保存できない' do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price should be ¥300~¥9,999,999")
      end
    end
  end
end
