class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index]

  def index
    @purchase = UserOrder.new
    if current_user.id == @item.user_id || @item.purchase != nil
    redirect_to root_path 
    end
  end

  def create

    @purchase = UserOrder.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
     redirect_to root_path
    else
       render 'index'
    end
  end

  private

  def purchase_params
    params.permit(:token, :item_id, :postal_code, :shipping_location_id, :city, :address, :building_name, :phonenumber).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
