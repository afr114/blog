class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @tags = @post.tags
  end

def create
  @post = Post.new(post_params)
  if @post.save
    flash[:notice] = "Post was successfully created"
    redirect_to admin_posts_path
  else
    flash[:alert] = "Post failed to save."
    render :new
  end
end

def edit
  @post = Post.find(params[:id])
end

def update
  @post = post.find(params[:id])
  if @post.update(post_params)
    redirect_to admin_posts_path
  else
    render :edit
  end
end

def destroy
  @post = Post.find(params[:id])
  @post.destroy
  redirect_to admin_posts_path
end

private
  def post_params
    params.require(:post).permit(:title, :content)
  end

end
