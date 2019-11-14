class PostsController < ApplicationController
  before_action:  :nombredelmetodo, only[:new, :create]

  def new
  end

  def create
  end

  def index
  end

  private

  def metodo
    redirect to root url unless signed_in?
  end

end
