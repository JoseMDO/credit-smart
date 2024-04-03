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


CreditCard.create({ name: "Freedom Unlimited", issuer: "Chase Bank", annual_fee: 0, url: "https://www.chase.com", details: "Test details", image_url: "https://rewardsccapi.blob.core.windows.net/ccr1212/1435429562.png" })
CreditCard.create({ name: "Blue Cash Preferred", issuer: "American Express", annual_fee: 95, url: "https://www.americanexpress.com", details: "Test details 2", image_url: "https://rewardsccapi.blob.core.windows.net/ccr1212/837101971.png" })

CreditCard.create({ 
    name: "Wells Fargo Active Cash", 
    issuer: "Wells Fargo", 
    annual_fee: 0, 
    url: "https://creditcards.wellsfargo.com/active-cash-credit-card/", 
    details: [
      {
        "24/7 Concierge service": "Find tickets to top sports and entertainment events, book travel, make dinner reservations and more with your complimentary 24/7 Visa Signature Concierge."
      }, 
      {
        "Cellular Telephone Protection": "Up to $600 of cell phone protection against damage or theft. Subject to a $25 deductible."
      },
      {
        "Luxury Hotel Collection": "The Active Cash Card offers you a premium collection of benefits at a selection of the world's most intriguing and prestigious properties. Benefits include room upgrade, late check-out and complimentary breakfast. Visit Visa Signature Hotel Collection7 and learn more."
      }],
       image_url: "https://rewardsccapi.blob.core.windows.net/ccr1212/1779647940.png" 
      })



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
  },
  {
    "Wells Fargo Active Cash":
    {
      "All": "2"
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
