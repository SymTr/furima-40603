class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_destination = PurchaseDestination.new
  end

  def create
    @purchase_destination = PurchaseDestination.new(purchase_destination_params)
    if @purchase_destination.valid?
      # pay_item
      @purchase_destination.save
      return redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_destination_params
    params.require(:purchase_destination).permit(:post_code, :origin_id, :city, :area_number, :building, :phone).merge(user_id: current_user.id, item_id: @item.id)
  end
    #あとで上記にtoken足す！！！！
  # def pay_item
  #   Payjp.api_key = ""　
  #   Payjp::Charge.create(
  #     amount: @item.price,              # Changed to fetch price from item
  #     card: purchase_params[:token],    # カードトークン
  #     currency: 'jpy'                   # 通貨の種類（日本円）
  #   )
  # end
end