class BuyController < ApplicationController
  require 'payjp'
  before_action :authenticate_user!
  before_action :set_item
  before_action :redirect_to_root

  def index
    @buy_address = BuyAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      pay_item
      @buy_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_address).permit(:user_id, :item_id, :postal_code, :area_id, :municipality, :address, :building_name, :tel, :token).merge(token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.money,
      card: buy_params[:token], 
      currency: 'jpy' 
    )
  end

  def redirect_to_root
    redirect_to root_path if @item.buy.present? || @item.user_id == current_user.id
  end

end
