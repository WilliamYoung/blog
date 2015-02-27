class PostsController < ApplicationController

	def index
		@posts = Post.all.order('created_at DESC')			
	end #index

	def new	
		
	end #new

	def create
		@post = Post.new post_params

		@post.save
		redirect_to @post
	end #create

	def show
		@post = Post.find params[:id]
	end #show



	private

	def post_params
		params.require(:post).permit(:title, :body)
	end #post_params

end
