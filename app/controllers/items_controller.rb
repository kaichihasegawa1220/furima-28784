class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")

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

  def show
  end


  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  # def destory
  #   @item.destory
  #   redirect_to root_path
  # end

  private
  def item_params
  params.require(:item).permit(:image, :name, :text, :genre_id, :condition_id, :payment_id, :shipping_location_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
