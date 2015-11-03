class SessionsController < ApplicationController

  def new
  end

  def create
    email = params[:email]
    password = params[:password]

    user = User.find_by email: email
    if user && user.authenticate(password)
      session[:user_id] = user.id
      redirect_to root_path, notice: "You have signed in!"
    else
      flash.now[:alert] = "Email and password do not match"
      render :new
    end
  end

  def delete
    session.delete :user_id
    redirect_to root_path, notice: "You have signed out!"
  end
end
