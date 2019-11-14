# frozen_string_literal: true

class ApplicationController < ActionController::Base   

  def sign_in
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      @user.remember
      cookies.permanent.signed[:user_id] = @user.id
      cookies.permanent[:remember_token] = @user.remember_token

      flash.now[:success] = "Logged in"
      render "users/show"
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render "sessions/new"
    end
  end

  #ag
  # Logs out the current user.
  def sign_out
    forget(@current_user)
    session.delete(:user_id)
    @current_user = nil
  end  


  # Returns the user corresponding to the remember token cookie.
  def current_user
    if (user_id = cookies.signed[:user_id])
      @current_user ||= User.find_by(id: user_id) 
    end
  end

  #ag
  # Returns true if the user is logged in, false otherwise.
  def sign_in?
    !current_user.nil?
  end

  #ag
  # Forgets a persistent session.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

end