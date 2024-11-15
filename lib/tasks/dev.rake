desc "Fill the database tables with some sample data"


task({ :sample_data => :environment }) do

  UserTransaction.destroy_all
  Favorite.destroy_all
  User.destroy_all

  users = []



  5.times do
    username = Faker::Name.first_name
    email = "#{username}@example.com"
    password = "password"
    users.append(User.create(username: username, email: email, password: password))
  end

  users.append(User.create(username: "alice", email: "alice@example.com", password: "password"))
  users.append(User.create(username: "bob", email: "bob@example.com", password: "password", admin: true))


  transactions = []

  users.each do |user|
    50.times do
      amount = Faker::Number.decimal(l_digits: rand(2..3))
      total_categories = Category.count

      # Select a random offset
      random_offset = rand(total_categories)

      # Find a random category using the offset
      random_category = Category.offset(random_offset).first
      category_id =random_category.id
      user_id = user.id
      description = Faker::Commerce.department

      transaction = UserTransaction.create(
        amount: amount,
        category_id: category_id,
        owner_id: user_id,
        description: description,
      )
      transactions.append(transaction)
    end
  end

    favorites = []

    users.each do |user|
    credit_cards = CreditCard.all
    credit_cards.each do |credit_card|
      id = credit_card.id
      favorite = Favorite.create(credit_card_id: id, user_id: user.id)
      favorites.append(favorite)
    end
  end


  puts "Generated #{users.count} users, and #{transactions.count} transactions, and #{favorites.count} favorites."
end
