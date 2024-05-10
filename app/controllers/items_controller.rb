class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  # 以下は間違えて先に書いてしまったので、のちほど使えるよう一時的にコメントアウトしました。

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_detail, :category_id,
                                 :condition_id, :freight_id, :origin_id,
                                 :delivery_date_id, :price).merge(user_id: current_user.id)
  end
end
