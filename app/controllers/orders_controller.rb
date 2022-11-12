class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
    if @item.user_id == current_user.id || @item.order
      redirect_to root_path 
    end
  end

  def create
    redirect_to new_card_path and return unless current_user.card.present?
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_address_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :addresses, :phone_number, :building).merge(
      token: current_user.card.customer_token, user_id: current_user.id, item_id: @item.id
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer_token = current_user.card.customer_token # ログインしているユーザーの顧客トークンを定義
    Payjp::Charge.create(
      amount: @item.price,
      customer: customer_token, # 顧客のトークン
      # card: order_address_params[:token],
      currency: 'jpy'
    )
  end
end
