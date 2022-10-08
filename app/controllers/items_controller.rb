class ItemsController < ApplicationController
  def index
  end

  def new
    unless user_signed_in? 
      redirect_to new_user_session_path
    end
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
