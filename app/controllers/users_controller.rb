class UsersController < ApplicationController 
  def show
    @current_user = current_user

    # validar que el current user sea igual al que hace las peticiones
    # denegar acceso a la vista de otros usuarios y solo autorizar acceso a la vista del usuario logueado
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      remember_user(@user)
      flash.now[:success] = "User created successfully"
      flash.now[:success] = "Login successfully"
      @current_user = @user
      redirect_to @user
    else
      flash.now[:danger] = "Check data input"
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
