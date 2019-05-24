# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."

Day.destroy_all
Goal.destroy_all
Wallet.destroy_all
User.destroy_all

puts 'Database cleaned!'

puts 'Creating categories...'

carlotta = User.create(email: "carlotta@gmail.com", password: "123456", first_name: "Carlotta", last_name: "Da Silva")

luca = User.create(email: "luca@gmail.com", password: "123456", first_name: "Luca", last_name: "Kuhn")

tarek = User.create(email: "tarek@gmail.com", password: "123456", first_name: "Tarek", last_name: "Rahme")

tjiani = User.create(email: "tjiani@gmail.com", password: "123456", first_name: "Tjiani", last_name: "Fulani")

puts 'Users created!'


puts "Creating wallets..."

carlotta_wallet = Wallet.create(user: carlotta)

luca_wallet = Wallet.create(user: luca)

tarek_wallet = Wallet.create(user: tarek)

tjiani_wallet = Wallet.create(user: tjiani)

puts "Wallets created!"


holiday = Goal.create(wallet: carlotta_wallet, name: "holiday",amount: 330)

laptop = Goal.create(wallet: luca_wallet, name: "laptop",amount: 800)

house = Goal.create(wallet: tarek_wallet, name: "house",amount: 300000)

ring = Goal.create(wallet: tjiani_wallet, name: "ring",amount: 240)

puts "Goals created"
