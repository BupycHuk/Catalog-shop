class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

	def new
	end

	def create
		@category = Category.new(params.require(:category).permit(:title))
		@category.save
		redirect_to @category
	end

	def show
	 	@category = Category.find(params[:id])
	 end

	def category_json
		@categories = Category.all
		render json: @categories
	end
end
