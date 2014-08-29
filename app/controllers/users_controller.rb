class UsersController < ApplicationController
  def new
    session[:user_id] = nil
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_to wall_path
    else
      flash[:errors] = @user.errors.full_messages
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
