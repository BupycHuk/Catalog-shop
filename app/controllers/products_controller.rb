class ProductsController < ApplicationController

  def index
    @products = Product.all
    respond_to do |format|
      format.json { render json: @products}
      format.html
    end
  end

  def show
  	@product = Product.find(params[:id])

  end

  def create
    @category = Category.find(params[:category_id])
    @product = @category.products.create(product_params)
    redirect_to category_path(@category)
  end

  def product_item
    @product = Product.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])
    @product.destroy
    redirect_to category_path(@category)
  end

   private
    def product_params
      params.require(:product).permit(:title, :price, :text, :picture)
    end
end
