class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :redirect_if_sold, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    redirect_to root_path if current_user.id == @item.user_id
    @purchase_destination = PurchaseDestination.new
  end

  def create
    @purchase_destination = PurchaseDestination.new(purchase_destination_params)
    if @purchase_destination.valid?
      pay_item
      @purchase_destination.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def redirect_if_sold
    redirect_to root_path if @item.purchase.present?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_destination_params
    params.require(:purchase_destination).permit(:post_code, :origin_id, :city, :area_number, :building, :phone, :price).merge(
      token: params[:token], user_id: current_user.id, item_id: @item.id
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,              # Changed to fetch price from item
      card: params[:token],             # カードトークン
      currency: 'jpy'                   # 通貨の種類（日本円）
    )
  end
end
