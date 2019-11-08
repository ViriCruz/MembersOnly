# frozen_string_literal: true

class ApplicationController < ActionController::Base   

  def sign_in 
    @user = User.find_by(email: params[:session][:email].downcase)
    # create new remember token here and save it in cookie permanent
    @user.remember
    # puts @user.remember_token contiene el token para guardar en la cookie
    if @user && @user.authenticate(params[:session][:password])
        flash.now[:success] = "Logged in"
        render "users/show"
    else
        flash.now[:danger] = 'Invalid email/password combination'
        render "sessions/new"
    end
  end

end
