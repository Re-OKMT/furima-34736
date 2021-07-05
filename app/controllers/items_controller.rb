class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    #@items = Item.order('created_at DESC')
    #@items = Item.includes(:user)
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

 # def edit
 #   @item = Item.find(params[:id])
 # end

  #def destroy
  #end

  private

  def item_params
    params.require(:item).permit(:image, :name, :category_id, :description, :status_id, :pay_shipping_id, :area_id,
                                 :shipping_day_id, :money).merge(user_id: current_user.id)
  end
end
