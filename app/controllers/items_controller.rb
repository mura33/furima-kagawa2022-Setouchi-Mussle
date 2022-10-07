class ItemsController < ApplicationController
  def index
  end

  before_action :authenticate_user!
  def new
    @item = Item.new
  end
end
