# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    redirect_to root_url if current_user
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    unless @user
      flash.now[:danger] = "This email doesn't exist"
      render 'sessions/new'
    end

    unless @user.authenticate(params[:session][:password])
      flash.now[:danger] = 'Invalid email/password combination'
      render 'sessions/new'
    end

    remember_user(@user)
    flash.now[:success] = 'Logged in'
    redirect_to root_url
  end

  def delete
    sign_out if signed_in?
    redirect_to root_url
  end
end
