require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe '商品購入Purchase' do
    before do
      user = FactoryBot.build(:user)
      item = FactoryBot.build(:item)
      @purchase = FactoryBot.build(:purchase, user:, item:)
    end

    context '有効な場合' do
      it '全てのフィールドが正しく存在すれば保存ができること' do
        expect(@purchase).to be_valid
      end
    end

    context '無効な場合' do
      it 'ユーザーが紐付いていなければ保存ができないこと' do
        @purchase.user = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('User must exist')
      end

      it 'アイテムが紐付いていなければ保存ができないこと' do
        @purchase.item = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Item must exist')
      end
    end
  end
end
