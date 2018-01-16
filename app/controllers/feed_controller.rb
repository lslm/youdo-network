class FeedController < ApplicationController
  def index
    @posts = Array.new

    current_user.posts.each do |current_user_posts|
      @posts << current_user_posts
    end

    current_user.following.each do |user|
      user.posts.each do |post|
        @posts << post
      end
    end

    @posts.sort_by! { |post| post[:created_at] }
  end
end
