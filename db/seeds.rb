z = User.create first_name: "Zachary",
                last_name: "Okuhara",
                email: "zokuhara@gmail.com",
                password: "12345678"

foodster_subscription = Subscription.create name: "Foodster Plus",
                                    stripe_id: "foodster_plus",
                                    interval: "month",
                                    amount: 499
