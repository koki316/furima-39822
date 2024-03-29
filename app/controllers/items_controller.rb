class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :get_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update]
  before_action :sold_out_move, only: [:edit]
  

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.destroy
      redirect_to '/'
    else
      redirect_to item_path
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
    unless @item.user == current_user
      redirect_to '/'
    end
  end

  def sold_out_move
    unless @item.purchase == nil
      redirect_to "/"
    end
  end

end
