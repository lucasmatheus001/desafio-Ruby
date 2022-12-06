#initial criation of seeds
puts "Creating seeds..."
puts "Creating Users..."

User.create(name: "Jhonny Depp",email: "jhonnydepp@gmail.com",password: "123456",password_confirmation: "123456",cpf: "072855994321",birthday: "1999-03-30")
User.create(name: "Leonardo DiCaprio",email: "Leionardo@gmail.com",password: "123456",password_confirmation: "123456",cpf: "04325599422",birthday: "1999-03-30")
User.create(name: "Julianna Margulies",email: "juliemarques@gmail.com",password: "123456",password_confirmation: "123456",cpf: "07285598222",birthday: "1999-03-30")
User.create(name: "Tom Hanks",email: "tomhanks@gmail.com",password: "123456",password_confirmation: "123456",cpf: "07285500932",birthday: "1999-03-30")


puts "Creating Accounts..."
@users = User.all
@users.each do |user|
  user.accounts.each do |account|
    Account.update(balance: account.balance = 400)
  end
end