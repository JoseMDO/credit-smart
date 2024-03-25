# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
credit_card = CreditCard.create({ name: "Freedom Unlimited", issuer: "Chase Bank", annual_fee: 0, url: "chase.com", details: "Test details" })

categories = Category.create([{
  name: "Auto"
},
{
  name: "Travel"
},
{
  name: "Shopping"
},
{
  name: "Miscellaneous"
}
])

reward1 = Reward.create({ category_id: Category.where(name: "Shopping").first.id, credit_card_id: credit_card.id, percentage_back: 2.00 })
reward2 = Reward.create({ category_id: Category.where(name: "Auto").first.id, credit_card_id: credit_card.id, percentage_back: 3.00 })
reward3 = Reward.create({ category_id: Category.where(name: "Travel").first.id, credit_card_id: credit_card.id, percentage_back: 5.00 })
reward4 = Reward.create({ category_id: Category.where(name: "Miscellaneous").first.id, credit_card_id: credit_card.id, percentage_back: 1.50 })
