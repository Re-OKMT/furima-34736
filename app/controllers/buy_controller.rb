class BuyController < ApplicationController
  require 'payjp'
  before_action :authenticate_user!
  before_action :set_item

  # 表示するビューがindexのみ必要でnewがいらない
  def index
    redirect_to root_path if @item.buy.present? || @item.user_id == current_user.id
    @buy_address = BuyAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      pay_item
      @buy_address.save
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_address).permit(:user_id, :item_id, :postal_code, :area_id, :municipality, :address, :building_name, :tel, :token).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.money, # 商品の値段
      card: buy_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def sold_out_item
    redirect_to root_path if @item.buy.present?
  end
end
