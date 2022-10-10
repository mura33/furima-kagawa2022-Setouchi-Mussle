class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :user_not, only: [:edit]

  def index
    @items = Item.includes(:user).order("created_at DESC")
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to  item_path(@item)
    else
      render :edit
    end
  end



  private

  def item_params
    params.require(:item).permit(:name, :info, :image, :price, :category_id, :prefecture_id, :sales_status_id,
                                 :scheduled_delivery_id, :shipping_fee_status_id).merge(user_id: current_user.id)
  end

  def user_not
    @item = Item.find(params[:id])
     unless @item.user_id == current_user.id
     redirect_to action: :index
     end
  end

  def move_to_index
    unless user_signed_in? 
      redirect_to  new_user_session_path
    end
  end

end
