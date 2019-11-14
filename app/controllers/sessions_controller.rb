class SessionsController < ApplicationController
  def new
    render 'users/show' if current_user
  end

  def create   
    sign_in  
  end

  def destroy
    
    #puts p = sign_in? ? sign_in? : sign_in? 
    sign_out if sign_in?
    #redirect_to root_url
  end

  
end
