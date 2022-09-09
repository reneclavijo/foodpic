class ProfilesController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @posts = current_user.posts
  end
end
