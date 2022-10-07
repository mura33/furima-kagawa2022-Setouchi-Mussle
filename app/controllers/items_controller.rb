class ItemsController < ApplicationController
  def index
  end

  before_action :authenticate_user!
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to root_path
  end


  private

  def item_params
    params.require(:item).permit(:name, :info, :image, :category_id, :prefecture_id, :sales_status_id, :scheduled_delivery_id, :shipping_fee_status_id).merge(user_id: current_user.id)
  end

end
