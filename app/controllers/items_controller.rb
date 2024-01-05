class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  
  def index
    @items = Item.all.order(id: :DESC)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end


  private

  def item_params
    params.require(:item).permit(:items_name, :description, :category_id, :condition_id, :pay_for_id, :prefecture_id, :ship_day_id, :price, :image).merge(user_id: current_user.id)
  end

 


end
