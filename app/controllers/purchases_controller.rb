class PurchasesController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
  end
end
