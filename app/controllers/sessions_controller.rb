class SessionsController < ApplicationController
  def new
    render 'users/show' if current_user
  end

  def create   
    sign_in  
  end

  def destroy
  end

  
end
