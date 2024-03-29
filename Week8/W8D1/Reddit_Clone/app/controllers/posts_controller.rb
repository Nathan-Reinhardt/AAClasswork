class PostsController < ApplicationController

  before_action :require_login
  
  def new 
    @post = Post.new 
  end

  def index
    @posts = Post.all
  end

  def create 
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save 
      redirect_to sub_url(@post.sub_id)
    else
      flash[:errors] = @post.errors.full_messages
      render :new 
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])  
    @post.sub_id = params[:sub_id]
    if @post.update(post_params)
       redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :edit 
    end
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy 
    render :new
  end      
end
