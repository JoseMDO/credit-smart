# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Reward.destroy_all
Favorite.destroy_all
UserTransaction.destroy_all
Category.destroy_all
CreditCard.destroy_all


credit_cards = CreditCard.create({ name: "Freedom Unlimited", issuer: "Chase Bank", annual_fee: 0, url: "https://www.chase.com", details: "Test details", image_url: "https://rewardsccapi.blob.core.windows.net/ccr1212/1435429562.png" })
credit_cards = CreditCard.create({ name: "Blue Cash Preferred", issuer: "American Express", annual_fee: 95, url: "https://www.americanexpress.com", details: "Test details 2", image_url: "https://rewardsccapi.blob.core.windows.net/ccr1212/837101971.png" })



categories = ["Travel", "Service", "All", "Shopping", "Payment", "Telecom", "Auto", "Business", "Charity", "Dining", "Entertainment", "Nonprofit", "Education", "Rent"]

categories.each do |category| 
  Category.create(name: category)
end


card_categories = [
  {
    "Freedom Unlimited": 
    {
      "Travel": 5.00, 
      "Dining": 3, 
      "Shopping": 3, 
      "All": 1.5
    }
  },
  {
    "Blue Cash Preferred":
    {
      "Auto": 6.00,
      "Shopping": 6.00,
      "Travel": 3.00,
      "Telecom": 6.00,
      "All": 1.00
    }
  } 
]

card_categories.each do |card_category|
  card_category.each do |card_name, categories|
    # Find the credit card by name
    credit_card = CreditCard.find_by(name: card_name.to_s)

    categories.each do |category_name, percentage_back|
      # Find or create the category by name
      category = Category.find_or_create_by(name: category_name.to_s)

      # Create the reward
      reward = Reward.create(category_id: category.id, credit_card_id: credit_card.id, percentage_back: percentage_back)
    end
  end
end


puts "Generated #{CreditCard.count} credit card's."
puts "Generated #{Category.count} Categroies."
puts "Generated #{Reward.count} Rewards."
