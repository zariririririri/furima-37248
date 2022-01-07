class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  # before_action :move_to_index,  except: [:new, :index]

  def index
    @products = Product.all
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

  private

  def product_params
    params.require(:product).permit(:name, :image, :explanation, :price, :prefecture_id, :category_id, :state_id, :delivery_id,
                                    :delivery_time_id).merge(user_id: current_user.id)
  end
end
