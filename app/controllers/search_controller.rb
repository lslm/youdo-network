class SearchController < ApplicationController
  def index
    @users = User.search(params[:term])
    @posts = Post.search(params[:term])
  end
end
