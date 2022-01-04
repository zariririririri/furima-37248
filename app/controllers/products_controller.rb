class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  # before_action :move_to_index,  except: [:new, :index]

  def index
  end
end
# def new
#  # @furima = Furima.new
# end

# def create
#  # @furima = Furima.new (furima_params)
#  # if @furima.valid?
#  #   @furima.save
#  #   redirect_to root_path
#  # else
#  #   render :new
# end

#  private

# #  def move_to_index
# #   unless user_signed_in?
# #    redirect_to action: :index
# #  end
# end
