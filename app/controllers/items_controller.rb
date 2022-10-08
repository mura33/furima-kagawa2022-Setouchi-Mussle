class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    redirect_to root_path
    else
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :info, :image, :price, :category_id, :prefecture_id, :sales_status_id, :scheduled_delivery_id, :shipping_fee_status_id).merge(user_id: current_user.id)
  end

end
