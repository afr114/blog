class UsersController < ApplicationController
  def index
    @posts = Post.all
  end


  def tags
  end

  def show
    @post = Post.find(params[:id])
    @tags = @post.tags
  end
end
