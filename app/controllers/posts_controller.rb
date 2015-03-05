class PostsController < ApplicationController
  def index
    @posts = Post.order(published_at: :desc).limit(10)
  end
end
