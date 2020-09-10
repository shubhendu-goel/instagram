class PostsController < ApplicationController
	def index
		@posts = Post.all
		@posts=@posts.sort_by{|p| p.updated_at}.reverse
	end
	def show
		@post = Post.find(params[:id])  		
	end
	def new
		@post=Post.new
	end
	def edit
		@post = Post.find(params[:id])
	end
	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to '/'
 		else
  			render 'new'
  		end
	end
	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
    		redirect_to '/'
		else
			render 'edit'
		end
	end
	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end
	private
	    def post_params
	    	params.require(:post).permit(:caption,:image_file)
	    end
end


