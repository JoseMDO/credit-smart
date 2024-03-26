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
  users.append(User.create(username: "bob", email: "bob@example.com", password: "password"))
  

  transactions = []

  users.each do |user|
    10.times do
      amount = Faker::Number.decimal(l_digits: 2)
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
  puts "Generated #{users.count} users, and #{transactions.count} transactions"
end
