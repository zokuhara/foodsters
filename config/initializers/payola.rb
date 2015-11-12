Payola.configure do |config|
 config.subscribe('payola.subscription.active') do |sub|
    user = User.find_by(email: sub.email)
    user.subscription = sub.plan
    user.save!
    sub.owner = user
    sub.save!
  end


  config.secret_key = 'sk_test_E3VVqeFWeRtGBe4jZX1n1od7'
  config.publishable_key = 'pk_test_tqSrylPqvVytJW2VxZz3bqBQ'
  # Example subscription:
  #
  # config.subscribe 'payola.package.sale.finished' do |sale|
  #   EmailSender.send_an_email(sale.email)
  # end
  #

  config.subscribe 'payola.subscription.sale.finished' do |sale|
    subscription = sale.production
    subscription.update(completed: true)
  end

  # In addition to any event that Stripe sends, you can subscribe
  # to the following special payola events:
  #
  #  - payola.<sellable class>.sale.finished
  #  - payola.<sellable class>.sale.refunded
  #  - payola.<sellable class>.sale.failed
  #
  # These events consume a Payola::Sale, not a Stripe::Event
  #
  # Example charge verifier:
  #
  # config.charge_verifier = lambda do |sale|
  #   raise "Nope!" if sale.email.includes?('yahoo.com')
  # end

  # Keep this subscription unless you want to disable refund handling
  config.subscribe 'charge.refunded' do |event|
    sale = Payola::Sale.find_by(stripe_id: event.data.object.id)
    sale.refund!
  end
end