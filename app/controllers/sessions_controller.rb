class SessionsController < ApplicationController
  def new
  end

  def create    
    sign_in  
  end

  def destroy
  end

  
end
