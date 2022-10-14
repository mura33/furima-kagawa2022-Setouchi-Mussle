class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    # @address = @order.user_id
    @order_address = OrderAddress.new
    if @item == current_user.id 
       redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])  
    @address = Address.create
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
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :addresses, :phone_number, :building).merge(token: params[:token],user_id: current_user.id,item_id: @item.id, address_id: @address.id)
  end

  # def order_params
  #   params.require(:order).permit(:price).merge(token: params[:token])
  # end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_address_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end 
end
