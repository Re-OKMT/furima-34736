class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :move_to_index, except: [:index, :show]
  # before_action :sold_out_item, only: [:index]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :ensure_user, only: [:edit, :update, :destroy]

  def index
    @items = Item.includes([:user]).order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :category_id, :description, :status_id, :pay_shipping_id, :area_id,
                                 :shipping_day_id, :money).merge(user_id: current_user.id)
  end

  def ensure_user
    redirect_to root_path unless @item.user == current_user
  end

  def set_item
    @item = Item.find(params[:id])
  end

  # def sold_out_item
  #  redirect_to root_path if @item.present?
  # end

  # def donation_params
  #  params.permit(:money.merge(user_id: current_user.id)
  # end
end
