class RecipesController < ApplicationController

	PER = 9

	def index
		@recipes = Recipe.page(params[:page]).per(PER)
	end

	def new
		@recipe = Recipe.new
		@genre = Genre.all
	end

	def create
		recipe = Recipe.new(recipe_params)
		recipe.user_id = current_user.id
	    recipe.save!
	    redirect_to recipe_path(recipe.id)
	end

	def update
	  	recipe = Recipe.find(params[:id])
	    recipe.update(recipe_params)
	    redirect_to recipes_path(recipe_params)
  	end

  	def show
    	@recipe = Recipe.find(params[:id])
    	@post_comment = PostComment.new
  	end

  	def edit
	    @recipe = Recipe.find(params[:id])
	    @genre = Genre.all
  	end

private

  	def recipe_params
     	params.require(:recipe).permit(:genre_id, :name, :discription, :image)
  	end

end