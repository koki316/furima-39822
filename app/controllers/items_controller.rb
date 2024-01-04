class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  
  def index
    @items = Item.all
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


  private

  def item_params
    params.require(:item).permit(:items_name, :description, :category_id, :condition_id, :pay_for_id, :prefecture_id, :ship_day_id, :price, :image).merge(user_id: current_user.id)
  end

 


end
