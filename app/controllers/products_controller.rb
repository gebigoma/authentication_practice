class ProductsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.prodcuts.new(product_params)
    # Product.new(product_params)
    # @product.user_id = current_user.id
    if @product.save
      redirect_to user_path(current_user.id)
    else
      # same as redirect_to new_product_path
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def product_params
      params.require(:product).permit(:title, :category)
    end
end
