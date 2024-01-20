class PurchaseController < ApplicationController
  before_action :authenticate_user!
  before_action :get_item, only: [:index, :create]
  before_action :get_purchase_address, only: [:index, :new,]

  def index
  end

  def new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to "/"
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  
  def get_item
    @item = Item.find(params[:item_id])
  end

  def get_purchase_address
    @purchase_address = PurchaseAddress.new
  end

  def purchase_params
    params.require(:purchase_address).permit(:postcode, :prefecture_id, :city, :street, :building, :tellnumber, :item_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
