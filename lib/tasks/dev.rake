desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  
  User.destroy_all
  UserTransaction.destroy_all
  Favorite.destroy_all


  users = []

  5.times do 
    username = Faker::Name.first_name
    email = "#{username}@example.com"
    password = "password"
    users.append(User.create(username: username, email: email, password: password))
  end

  transactions = []

  users.each do |user|
    10.times do
      amount = Faker::Number.decimal(l_digits: 2)
      category_id = rand(4..18)
      user_id = user.id
      description = Faker::Commerce.department

      transaction = UserTransaction.create(
        amount: amount, 
        category_id: category_id,
        owner_id: user_id,
        description: description
      )
      transactions.append(transaction)
    end
  end
  puts "Generated #{users.count} users, and #{transactions.count} transactions"
end
