class Admin::TagsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @tag = @post.tags.new
  end

  def create
    @post = Post.find(params[:post_id])
    @tag = @post.tags.new(tag_params)
    if @tag.save
      redirect_to admin_post_path(@post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @tag = @post.tags.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @tag = @post.tags.find(params[:id])
      if @tags.update(tag_params)
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

    def taglist
      @post = Post.find(params[:post_id])
    end

  private
    def tag_params
      params.require(:tag).permit(:name, :post_id)
    end

end
