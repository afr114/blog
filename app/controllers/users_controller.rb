class UsersController < ApplicationController
  def index
    @posts = Post.all
    @tags = Tag.all
    binding.pry
  end

  def show
    @post = Post.find(params[:id])
    @tags = @post.tags
  end
end
