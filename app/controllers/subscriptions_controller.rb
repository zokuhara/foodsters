class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  include Payola::StatusBehavior

  def new
    @plan = Subscription.first
  end

  def confirmation
    @sale = Payola::Subscription.find_by! guid: params[:sale_guid]
    @subscription = @sale.current_period_end
  end
end
