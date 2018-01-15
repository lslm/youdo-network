class FeedController < ApplicationController
  def index
    @posts = Post.where(user_id: Relationship.select(:following_id).where(follower_id: current_user.id)).includes(:user)
  end
end
