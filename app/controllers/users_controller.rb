class UsersController < ApplicationController 

  def show
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #flash: user created successfull
      redirect_to users_url(user.id)
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
