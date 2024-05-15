require 'rails_helper'

RSpec.describe Destination, type: :model do
  before do
    @destination = FactoryBot.build(:destination)
  end

  context '内容に問題ない場合' do
    it "全てのフィールドが正しければ保存ができること" do
      expect(@destination).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "post_codeが空では保存ができないこと" do
      @destination.post_code = nil
      @destination.valid?
      expect(@destination.errors.full_messages).to include("Post code can't be blank")
    end

    it "post_codeが「3桁ハイフン4桁」の形式でないと保存できないこと" do
      @destination.post_code = "1234567"
      @destination.valid?
      expect(@destination.errors.full_messages).to include("Post code is invalid")
    end

    it "cityが空では保存ができないこと" do
      @destination.city = nil
      @destination.valid?
      expect(@destination.errors.full_messages).to include("City can't be blank")
    end

    it "origin_idが空では保存ができないこと" do
      @destination.origin_id = nil
      @destination.valid?
      expect(@destination.errors.full_messages).to include("Origin can't be blank")
    end

    it "area_numberが空では保存ができないこと" do
      @destination.area_number = nil
      @destination.valid?
      expect(@destination.errors.full_messages).to include("Area number can't be blank")
    end

    it "phoneが空では保存ができないこと" do
      @destination.phone = nil
      @destination.valid?
      expect(@destination.errors.full_messages).to include("Phone can't be blank")
    end

    it "phoneが10桁以上11桁以内でないと保存できないこと" do
      @destination.phone = "01234567" # 8桁
      @destination.valid?
      expect(@destination.errors.full_messages).to include("Phone is too short (minimum is 10 characters)")

      @destination.phone = "0123456789012" # 13桁
      @destination.valid?
      expect(@destination.errors.full_messages).to include("Phone is too long (maximum is 11 characters)")
    end

    it "phoneがハイフンを含むと保存できないこと" do
      @destination.phone = "090-1234-5678"
      @destination.valid?
      expect(@destination.errors.full_messages).to include("Phone is invalid")
    end

    it "purchaseが紐付いていなければ保存ができないこと" do
      @destination.purchase = nil
      @destination.valid?
      expect(@destination.errors.full_messages).to include("Purchase can't be blank")
    end
  end
end