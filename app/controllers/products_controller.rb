class ProductsController < ApplicationController
  def show
  	@product = Product.find(params[:id])
  end

  def create
    @category = Category.find(params[:category_id])
    @product = @category.products.create(product_params)
    redirect_to category_path(@category)
  end

  def product_json
      @products = Product.all
      render json: @products
  end

  def product_item
    @product = Product.find(params[:id])
  end

   private
    def product_params
      params.require(:product).permit(:title, :price, :text, :picture)
    end
end
