class BuysController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_product, only: [:index, :create]
  
  def index  
     @buy_receiver = BuyReceiver.new
  end
  
  def create 
    @buy_receiver = BuyReceiver.new(buy_params)
    if @buy_receiver.valid?
      pay_product
      @buy_receiver.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def buy_params
   params.permit(:post_code, :telephone_number, :city, :house_number, :prefecture_id, :building).
                                   merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end
  
  def pay_product
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.product_price,
      buy: buy_params[:token],
      currency: 'jpy' )
  end
 
  def set_product
    @product = Product.find(params[:product_id])
  end

  def move_to_index
    @product = Product.find(params[:product_id])
    redirect_to root_path if current_user == @product.user || @product.card.present?
  end
end

  