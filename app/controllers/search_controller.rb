class SearchController < ApplicationController
  def index
    @users = User.search(params[:term])
  end
end
