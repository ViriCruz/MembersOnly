# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    redirect_to root_url if current_user
  end

  def create
    sign_in
  end

  def delete
    sign_out if signed_in?
    redirect_to root_url
  end
end
