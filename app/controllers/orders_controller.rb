class OrdersController < ApplicationController
  def index
    @order = Item.find(params[:item_id])
  end

  def create
    @orders = Order.new
    @addresses = Address.new
  end
end
