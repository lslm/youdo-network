class SearchController < ApplicationController
  def index
    @users = User.search(params[:term])
    @posts = Post.search(params[:term])
    @users_directory = User.all
  end
end
