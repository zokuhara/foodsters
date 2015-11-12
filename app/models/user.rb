class User < ActiveRecord::Base
  has_secure_password
  has_many :recipes
  belongs_to :subscription

  def payola_subscription
    Payola::Subscription.find_by owner_type: "User", owner_id: id
  end
end
