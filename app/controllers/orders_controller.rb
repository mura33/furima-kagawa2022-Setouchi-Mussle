class OrdersController < ApplicationController
  def index
  end

  def create
    @orders = Order.new
    @addresses = Address.new
  end
end
