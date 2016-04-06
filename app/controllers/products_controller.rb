class ProductsController < ApplicationController

  def index
    if params[:category_id]
      @products = Product.where(:category_id => params[:category_id])
    else
      @products = Product.all
    end
    product_json = JSON.parse(@products.to_json(:include => { :category => { :only => :title } }))
    respond_to do |format|
      format.json { render json: {'products' => product_json} }
      format.html
    end
  end

  def show
    begin
      @product = Product.find(params[:id])
      product_json = JSON.parse(@product.to_json(:include => { :category => { :only => :title } }))
      respond_to do |format|
        format.json { render json: {'product' => product_json}}
        format.html
      end
    rescue ActiveRecord::RecordNotFound => e
      not_found
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html {
          redirect_to @product
        }
        format.json {
          render json: @product
        }
      else
        format.html {
          render 'new'
        }
        format.json {
          render json: @product.errors, status: :unprocessable_entity
        }
      end
    end

  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to @product
  end

  def product_item
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:title, :price, :text, :picture, :category_id)
  end
end
