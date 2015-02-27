class PostsController < ApplicationController

	def index
		@posts = Post.all.order('created_at DESC')			
	end #index

	def new	
		@post = Post.new
	end #new

	def create
		@post = Post.new post_params

		if @post.save
			redirect_to @post
		else
			render 'new'
		end

	end #create

	def show
		@post = Post.find params[:id]
	end #show


	def edit
		@post = Post.find params[:id]
	end #edit

	def update
		@post = Post.find params[:id]

		if @post.update(params[:post].permit(:title, :body))
			redirect_to @post
		else
			render 'edit'
		end #if
	end #update

	def destroy
		@post = Post.find params [:id]
		@post.destroy

		redirect_to posts_path
	end #destroy

	private

	def post_params
		params.require(:post).permit(:title, :body)
	end #post_params

end
