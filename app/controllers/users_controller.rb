class UsersController < ApplicationController 
  before_action :correct_user,   only: [:show]

  def show
    #@current_user = current_user
    @current_user = User.find(params[:id])

    # validar que el current user sea igual al que hace las peticiones
    # denegar acceso a la vista de otros usuarios y solo autorizar acceso a la vista del usuario logueado
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      remember_user(@user)
      flash[:success] = "Account created successfully"
      flash[:info] = "Login successfully"
      @current_user = @user
      redirect_to @user
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(posts_url) unless current_user?(@user)
  end
end
