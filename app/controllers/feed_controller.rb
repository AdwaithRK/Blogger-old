class FeedController < ApplicationController
  def show
    @posts = Post.includes(:user).all.order("created_at");  
    # @posts.order("created_at");
  end
end