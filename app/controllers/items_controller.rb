class ItemsController < ApplicationController
  def index
  end

  before_action :authenticate_user!
  def new
    @item = Item.new
  end


  private

  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end

end
