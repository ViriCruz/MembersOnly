class PostsController < ApplicationController
  before_action :authorize_user, only: [:new, :create]

  def new
  end

  def create
    
  end

  def index
  end

  private

  def authorize_user
    unless signed_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end   
  end

end
