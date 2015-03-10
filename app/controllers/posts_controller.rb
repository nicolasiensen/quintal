class PostsController < ApplicationController
  def index
    @posts = Post.order(published_at: :desc).limit(10)

    @category = Category.find_by(slug: params[:category_slug])
    @posts = @posts.where(category_id: @category.id) if @category.present?
  end
end
