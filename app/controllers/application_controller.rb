# frozen_string_literal: true

class ApplicationController < ActionController::Base   

  def sign_in

    @user = User.find_by(email: params[:session][:email].downcase)
    # create new remember token here and save it in cookie permanent    
    # puts @user.remember_token contiene el token para guardar en la cookie
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

  # Returns the user corresponding to the remember token cookie.
  def current_user
    if (user_id = cookies.signed[:user_id])
      @current_user ||= User.find_by(id: user_id) 
    end
  end


end
