class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    cat ={'categories' => @categories}
    respond_to do |format|
      format.json { render json: cat }
      format.html
    end
  end

  def show
    begin
      @category = Category.find(params[:id])
      cat ={'category' => @category}
      respond_to do |format|
        format.json { render json: cat}
        format.html
      end
    rescue ActiveRecord::RecordNotFound => e
      not_found
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html {
          redirect_to @category
        }
        format.json {
          render json: @category
        }
      else
        format.html {
          render 'new'
        }
        format.json {
          render json: @category.errors, status: :unprocessable_entity
        }
      end
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to @category
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:title)
  end

end
