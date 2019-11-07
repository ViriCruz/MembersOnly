# frozen_string_literal: true

class ApplicationController < ActionController::Base   

  def sign_in 
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
        flash.now[:success] = "Logged in"
        render "users/show"
    else
        flash.now[:danger] = 'Invalid email/password combination'
        render "sessions/new"
    end
  end

end
