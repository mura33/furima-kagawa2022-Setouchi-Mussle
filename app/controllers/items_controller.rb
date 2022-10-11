class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :user_not, only: [:edit, :update]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
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
    redirect_to action: :index unless @item.user_id == current_user.id
  end

end
