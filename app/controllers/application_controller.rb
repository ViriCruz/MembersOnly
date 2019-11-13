# frozen_string_literal: true

class ApplicationController < ActionController::Base   

  def cookie_creation
    cookies.permanent[:test] = "foobar"
  end

  def cookie_deletion
    cookies.delete :test   
  end

  def sign_in
    
    # @user = User.find_by(email: params[:session][:email].downcase)
    # if @user && @user.authenticate(params[:session][:password])
    #   @user.remember
    #   cookies.permanent.signed[:user_id] = @user.id
    #   cookies.permanent[:remember_token] = @user.remember_token     
    #   # create new remember token here and save it in cookie permanent    
    #   # puts @user.remember_token contiene el token para guardar en la cookie
    #   flash.now[:success] = "Logged in"
    #   render "users/show"
    # else
    #   flash.now[:danger] = 'Invalid email/password combination'
    #   render "sessions/new"
    # end
  end

  #ag
  # Logs out the current user.
  def sign_out
    cookies.delete :test
    #user.forget
    #session.delete(:user_id)    
    #@current_user = nil
    #cookies.delete :user_id
    # cookies[:user_id] = "asdfasdasfd"
    #cookies.delete :remember_token #    , domain: 'localhost:4000'
    # cookies[:remember_token] = "asdfasdfasdf"


  end  


  # Returns the user corresponding to the remember token cookie.
  def current_user
    # if (user_id = cookies.signed[:user_id])
    #   @current_user ||= User.find_by(id: user_id) 
    # end
  end

  #ag
  # Returns true if the user is logged in, false otherwise.
  def signed_in?
    !@current_user.nil?
  end

  

end