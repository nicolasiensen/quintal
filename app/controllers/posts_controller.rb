class PostsController < ApplicationController
  def index
    @posts = Post.order(published_at: :desc).limit(3)

    @category = Category.find_by(slug: params[:category_slug])
    @posts = @posts.where(category_id: @category.id) if @category.present?
  end

  def show
    @post = Post.find(params[:id])
    @category = @post.category
    @tags = @post.tags
    @comments = @post.comments.order(created_at: :desc)
  end
end
