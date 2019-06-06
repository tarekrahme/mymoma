# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."

Transaction.destroy_all
Day.destroy_all
Goal.destroy_all
Wallet.destroy_all
User.destroy_all

puts 'Database cleaned!'

puts 'Creating categories...'

alex = User.create(email: "alex@gmail.com", password: "123456", first_name: "Alex", last_name: "Da Silva")
luca = User.create(email: "luca@gmail.com", password: "123456", first_name: "Luca", last_name: "Kuhn")
tarek = User.create(email: "tarek@gmail.com", password: "123456", first_name: "Tarek", last_name: "Rahme")
tjiani = User.create(email: "tjiani@gmail.com", password: "123456", first_name: "Tjiani", last_name: "Fulani")

puts 'Users created!'


puts "Creating wallets..."

alex_wallet = Wallet.create(user: alex, monthly_income_cents: 2000, savings_cents: 100, fixed_cost_cents: 1000)
luca_wallet = Wallet.create(user: luca, monthly_income_cents: 2100, savings_cents: 100, fixed_cost_cents: 900)
tarek_wallet = Wallet.create(user: tarek, monthly_income_cents: 1900, savings_cents: 50, fixed_cost_cents: 900)
tjiani_wallet = Wallet.create(user: tjiani, monthly_income_cents: 2300, savings_cents: 150, fixed_cost_cents: 1000)

puts "Wallets created!"


puts "Creating goals..."

# travel = Goal.create(wallet: alex_wallet, name: "travel",amount: 300, completion_date: Date.today + 100)
laptop = Goal.create(wallet: luca_wallet, name: "laptop",amount: 800, completion_date: Date.today + 100)
house = Goal.create(wallet: tarek_wallet, name: "house",amount: 300000, completion_date: Date.today + 100)
ring = Goal.create(wallet: tjiani_wallet, name: "ring",amount: 240, completion_date: Date.today + 100)

puts "Goals created"


puts "Creating days..."

days_ago_7 = Day.create(date: Date.today - 7, wallet: alex_wallet)
days_ago_6 = Day.create(date: Date.today - 6, wallet: alex_wallet)
days_ago_5 = Day.create(date: Date.today - 5, wallet: alex_wallet)
days_ago_4 = Day.create(date: Date.today - 4, wallet: alex_wallet)
days_ago_3 = Day.create(date: Date.today - 3, wallet: alex_wallet)
days_ago_2 = Day.create(date: Date.today - 2, wallet: alex_wallet)
days_ago_1 = Day.create(date: Date.today - 1, wallet: alex_wallet)
days_ago_0 = Day.create(date: Date.today, wallet: alex_wallet)

puts "Days created"


puts "Creating transactions..."

carl_trans_0_1 = Transaction.create(wallet: alex_wallet, day: days_ago_0, amount_cents: 200, merchant: "Pret")
carl_trans_0_2 = Transaction.create(wallet: alex_wallet, day: days_ago_0, amount_cents: 300, merchant: "Eat")
carl_trans_0_3 = Transaction.create(wallet: alex_wallet, day: days_ago_0, amount_cents: 400, merchant: "Bakery")
carl_trans_0_4 = Transaction.create(wallet: alex_wallet, day: days_ago_0, amount_cents: 500, merchant: "Pharmacy")
carl_trans_1_1 = Transaction.create(wallet: alex_wallet, day: days_ago_1, amount_cents: 600, merchant: "Book")
carl_trans_1_2 = Transaction.create(wallet: alex_wallet, day: days_ago_1, amount_cents: 700, merchant: "Water")
carl_trans_1_3 = Transaction.create(wallet: alex_wallet, day: days_ago_1, amount_cents: 800, merchant: "Plant")
carl_trans_1_4 = Transaction.create(wallet: alex_wallet, day: days_ago_1, amount_cents: 900, merchant: "Plug")
carl_trans_2_1 = Transaction.create(wallet: alex_wallet, day: days_ago_2, amount_cents: 200, merchant: "Pret")
carl_trans_2_2 = Transaction.create(wallet: alex_wallet, day: days_ago_2, amount_cents: 300, merchant: "Eat")
carl_trans_2_3 = Transaction.create(wallet: alex_wallet, day: days_ago_2, amount_cents: 400, merchant: "Bakery")
carl_trans_2_4 = Transaction.create(wallet: alex_wallet, day: days_ago_2, amount_cents: 500, merchant: "Pharmacy")
carl_trans_3_1 = Transaction.create(wallet: alex_wallet, day: days_ago_3, amount_cents: 600, merchant: "Book")
carl_trans_3_2 = Transaction.create(wallet: alex_wallet, day: days_ago_3, amount_cents: 700, merchant: "Water")
carl_trans_3_3 = Transaction.create(wallet: alex_wallet, day: days_ago_3, amount_cents: 800, merchant: "Plant")
carl_trans_3_4 = Transaction.create(wallet: alex_wallet, day: days_ago_3, amount_cents: 900, merchant: "Plug")
carl_trans_4_1 = Transaction.create(wallet: alex_wallet, day: days_ago_4, amount_cents: 100, merchant: "Eat")
carl_trans_4_2 = Transaction.create(wallet: alex_wallet, day: days_ago_4, amount_cents: 200, merchant: "Water")
carl_trans_4_3 = Transaction.create(wallet: alex_wallet, day: days_ago_4, amount_cents: 800, merchant: "Coffee")
carl_trans_4_4 = Transaction.create(wallet: alex_wallet, day: days_ago_4, amount_cents: 600, merchant: "Book")
carl_trans_5_1 = Transaction.create(wallet: alex_wallet, day: days_ago_5, amount_cents: 300, merchant: "Tea")
carl_trans_5_2 = Transaction.create(wallet: alex_wallet, day: days_ago_5, amount_cents: 250, merchant: "Dog")
carl_trans_5_3 = Transaction.create(wallet: alex_wallet, day: days_ago_5, amount_cents: 850, merchant: "Drink")
carl_trans_5_4 = Transaction.create(wallet: alex_wallet, day: days_ago_5, amount_cents: 550, merchant: "Paper")
carl_trans_6_1 = Transaction.create(wallet: alex_wallet, day: days_ago_6, amount_cents: 400, merchant: "Bottle")
carl_trans_6_2 = Transaction.create(wallet: alex_wallet, day: days_ago_6, amount_cents: 450, merchant: "Wood")
carl_trans_6_3 = Transaction.create(wallet: alex_wallet, day: days_ago_6, amount_cents: 450, merchant: "Cat")
carl_trans_6_4 = Transaction.create(wallet: alex_wallet, day: days_ago_6, amount_cents: 450, merchant: "Car")
carl_trans_7_1 = Transaction.create(wallet: alex_wallet, day: days_ago_7, amount_cents: 400, merchant: "Bottle")
carl_trans_7_2 = Transaction.create(wallet: alex_wallet, day: days_ago_7, amount_cents: 450, merchant: "Wood")
carl_trans_7_3 = Transaction.create(wallet: alex_wallet, day: days_ago_7, amount_cents: 450, merchant: "Cat")
carl_trans_7_4 = Transaction.create(wallet: alex_wallet, day: days_ago_7, amount_cents: 450, merchant: "Car")

puts "Transactions created"













