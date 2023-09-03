class PurchasesController < ApplicationController
  before_action :authenticate_user!
  def new
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
    if @item.purchase || current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :street_number, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
