class PostsController < ApplicationController
  before_action :authorize_user, only: [:new, :create]

  def new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save #sucess      
      redirect_to posts_url
    else #failure
      #flash message danger or error
      redirect_to post_create
    end
  end

  def index
    @posts = Post.all
    current_user
  end  

  private

  def post_params
    params.require(:post).permit(:body, :title)
  end

  def authorize_user
    unless signed_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end   
  end

end
