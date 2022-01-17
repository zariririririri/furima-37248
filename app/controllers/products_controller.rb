class ProductsController < ApplicationController
  before_action :authenticate_user!,  except: [:index, :show]
  before_action :set_product,         only: [:edit, :show, :update, :destroy]
  before_action :correct_products,    only: [:update, :destroy, :edit]
 
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
  end
  
  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end
   
  def destroy
    @product.destroy
    redirect_to root_path
  end
    
  private

  
   def product_params
    params.require(:product).permit(:name, :image, :explanation, :price, :prefecture_id, :category_id, :state_id, :delivery_id,
                                    :delivery_time_id).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def correct_products
    if current_user.id != @product.user.id || @product.buy != nil
      redirect_to root_path 
   end
 end
end