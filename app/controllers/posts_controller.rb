class PostsController < ApplicationController
  before_action :authorize_user, only: [:new, :create]

  def new
  end

  def create
    @post = current_user.posts.build(post_params)
  end

  def index
    @posts = Post.all
  end

  

  private

  def post_params
    # params.require(:post).permit
  end

  def authorize_user
    unless signed_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end   
  end

end
