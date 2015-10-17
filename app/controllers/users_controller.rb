class UsersController < ApplicationController
  def index
    @posts = Post.all
    @tags = Tag.all
  end

  def show
    @post = Post.find(params[:id])
    @tags = @post.tags
  end
end
