class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action do
    @current_user = User.find_by id: session[:user_id]
  end

  def authenticate_user!
    if @current_user.blank?
      redirect_to root_path
    end
  end

  def authenticate_subscription!
    if @current_user.payola_subscription.blank?
      redirect_to new_subscription_path, alert: "A subscription is required to use this feature"
    else
      if Time.now > @current_user.payola_subscription.current_period_end
        redirect_to new_subscription_path, alert: "Your subscription has expired"
      end
    end
  end
end
