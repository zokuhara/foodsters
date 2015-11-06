class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
    if @user.save
      session[:user_id] = @user.id
      redirect_to details_path
    else
      render :new
    end
  end

  def info
    @user = User.find params[:id]
  end
end
