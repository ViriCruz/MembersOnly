# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Logs out the current user.
  def sign_out
    @current_user.forget
    cookies.delete :user_id
    cookies.delete :remember_token
  end

  # Returns the user corresponding to the remember token cookie.
  def current_user
    return unless (user_id = cookies.signed[:user_id])

    @current_user ||= User.find_by(id: user_id)
  end

  attr_writer :current_user

  # Returns true if the user is logged in, false otherwise.
  def signed_in?
    !current_user.nil?
  end

  def current_user?(user)
    user == current_user
  end

  private

  def remember_user(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end
end
