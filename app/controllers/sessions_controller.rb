class SessionsController < ApplicationController


  # create the session resource ie, let user log in
  def create
    # this references the function we I made in user.rb
    user = User.authenticate(params[:email], params[:password])

    if user.nil?
      flash[:error] = "Invalid email/password combination."
      render 'new'
    else
      sign_in user
      redirect_to wall_path
    end

  end

  def destroy
    sign_out
    redirect_to new_user_path
  end
end
