class SessionsController < ApplicationController
  def new
    render 'users/show' if current_user
  end

  def create   
    sign_in  
  end

  def destroy
    sign_out if sign_in?
    #redirect_to root_url
  end

  
end
