class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order = Item.find(params[:item_id])
    @order_address = OrderAddress.new
    if @order == current_user.id 
       redirect_to root_path
    end
  end

  def create
    @order = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_address_params)
      if @order_address.valid?
        pay_item
        @order_address.save
        return redirect_to root_path
      else
        render 'index'
      end
  end



  private

  def order_address_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :phone_number, :building, :price).merge(user_id: current_user.id)
  end



  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end 
end
