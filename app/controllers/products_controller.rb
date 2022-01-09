class ProductsController < ApplicationController
  before_action :authenticate_user!, except: :index
  # before_action :set_product, only: [:edit, :show]

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    # @product = Product.find(params[:id])
  end

  def update
    # product = Product.find(params[:id])
    # product.update(product_params)
  end

  def edit
    # @product = Product.find(params[:id])
  end

  def destroy
    # product = Product.find(params[:id])
    # product.destroy
    # redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :image, :explanation, :price, :prefecture_id, :category_id, :state_id, :delivery_id,
                                    :delivery_time_id).merge(user_id: current_user.id)
  end

  # def set_product
  #    @product = Product.find(params[:id])
  # end
end
