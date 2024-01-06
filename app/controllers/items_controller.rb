class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :get_item, only: [:edit, :update]
  before_action :move_to_index, only: [:edit, :update]

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

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to '/'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:items_name, :description, :category_id, :condition_id, :pay_for_id, :prefecture_id, :ship_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def get_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to '/'
    unless 
      @item.user == current_user
    end
  end

end
