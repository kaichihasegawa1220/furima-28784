class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      return redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :text, :genre_id, :condition_id, :payment_id, :shipping_location_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
