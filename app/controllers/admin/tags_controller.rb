class Admin::TagsController < ApplicationController
  before_action :select_post, only: [:new, :create, :edit, :update]

  def index
    @tag = Tag.find(params[:post_id])
  end

  def show
  end

  def new
    @tag = @post.tags.new
  end

  def create
    @post = Post.find(params[:post_id])
    @tag = @post.tags.new(tag_params)
    @post.tags.push(@tag)
    if @tag.save
      redirect_to admin_post_path(@post)
    else
      render :new
    end
  end

  def edit
    @tag = @post.tags.find(params[:id])
  end

  def update
    @tag = @post.tags.find(params[:id])
      if @tag.update(tag_params)
        redirect_to admin_post_path(@post)
      else
        render :edit
      end
    end

    def destroy
      @tag = Tag.find(params[:id])
      @tag.destroy
      redirect_to admin_post_path(@tag.post_id)
    end

  private
    def tag_params
      params.require(:tag).permit(:name, :post_id)
    end

    def select_post
      @post = Post.find(params[:post_id])
    end

end
