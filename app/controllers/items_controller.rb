class ItemsController < ApplicationController  
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @items = Item.find(params[:id])
    @seller = @items.user
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :text, :category_id, :condition_id, :postage_id, :prefecture_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end
end
