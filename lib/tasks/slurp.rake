namespace :slurp do
  require "csv"
  desc "prefills production databse with required data"
  
  task categories: :environment do
    Reward.destroy_all
    UserTransaction.destroy_all
    Category.destroy_all
    
    csv_text = File.read(Rails.root.join("lib", "csvs", "categories.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    
    csv.each do |row|
      category = Category.new
      category.name = row["name"]
      category.save
      puts "#{category.name} created and saved successfully."
    end
    puts "Generated #{Category.count} Categories."
  end
 

  task credit_cards: :environment do
    Favorite.destroy_all
    CreditCard.destroy_all

    csv_text = File.read(Rails.root.join("lib", "csvs", "credit_cards.csv"))
    csv = CSV.parse(csv_text, headers: true, encoding: "UTF-8")

    csv.each do |row|
      credit_card = CreditCard.new
      credit_card.name = row["name"]
      credit_card.issuer = row["issuer"]
      credit_card.annual_fee = row["annual_fee"]
      credit_card.url = row["url"]
      credit_card.details = row["details"]
      credit_card.image_url = row["image_url"]
      credit_card.save
      puts "#{credit_card.name} created and saved successfully."
    end
    
    puts "Generated #{CreditCard.count} Credit Cards."
  end




  task rewards: :environment do
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
      },
      {
        "Chase Sapphire Preferred®":
        {
          "All": 1,
          "Travel": 5,
          "Dining": 3,
          "Shopping": 3,
          "Telecom": 3  
        }
      },
      {
        "BMO Harris Bank Cash Back Mastercard":
        {
          "All": 1,
          "Auto": 3,
          "Shopping": 3,
          "Telecom": 5, 
        }
      },
      {
        "American Express® Gold":
        {
          "All": 1,
          "Dining": 4,
          "Shopping": 4,
          "Travel": 3, 
        }
      },
      {
        "Discover it® Cash Back":
        {
          "All": 1,
          "Auto": 5,
          "Shopping": 5,
          "Travel": 5, 
        }
      },
      {
        "Bank of America® Unlimited Cash Rewards":
        {
          "All": 1.5, 
        }
      },
      {
        "Citi Double Cash®":
        {
          "All": 2, 
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
    puts "Generated #{Reward.count} Rewards"


  end
end
