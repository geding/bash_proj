class HomeController < ApplicationController
  def index
    redirect_to posts_url
    #@users = User.all
  end
end
