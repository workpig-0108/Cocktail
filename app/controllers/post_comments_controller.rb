class PostCommentsController < ApplicationController

	def create
		recipe = Recipe.find(params[:recipe_id])
	    comment = current_user.post_comments.new(post_comment_params)
	    comment.recipe_id =recipe.id
	    comment.save
	    redirect_to recipe_path(recipe)
  	end

  	def destroy
  		PostComment.find_by(id: params[:id], recipe_id: params[:recipe_id]).destroy
    	redirect_to recipe_path(params[:recipe_id])
  	end

  	private
	def post_comment_params
		params.require(:post_comment).permit(:comment)
	end
end
