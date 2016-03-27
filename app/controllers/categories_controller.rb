class CategoriesController < ApplicationController
  def index
    @categories = Category.all
		respond_to do |format|
			format.json { render json: @categories}
			format.html
		end
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
end
