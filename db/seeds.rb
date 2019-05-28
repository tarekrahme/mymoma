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


puts "Creating goals..."

holiday = Goal.create(wallet: carlotta_wallet, name: "holiday",amount: 330)

laptop = Goal.create(wallet: luca_wallet, name: "laptop",amount: 800)

house = Goal.create(wallet: tarek_wallet, name: "house",amount: 300000)

ring = Goal.create(wallet: tjiani_wallet, name: "ring",amount: 240)

puts "Goals created"


puts "Creating days..."

days_ago_7 = Day.create(date: Date.today - 7, wallet: carlotta_wallet, goal: holiday)
days_ago_6 = Day.create(date: Date.today - 6, wallet: carlotta_wallet, goal: holiday)
days_ago_5 = Day.create(date: Date.today - 5, wallet: carlotta_wallet, goal: holiday)
days_ago_4 = Day.create(date: Date.today - 4, wallet: carlotta_wallet, goal: holiday)
days_ago_3 = Day.create(date: Date.today - 3, wallet: carlotta_wallet, goal: holiday)
days_ago_2 = Day.create(date: Date.today - 2, wallet: carlotta_wallet, goal: holiday)
days_ago_1 = Day.create(date: Date.today - 1, wallet: carlotta_wallet, goal: holiday)
days_ago_0 = Day.create(date: Date.today, wallet: carlotta_wallet, goal: holiday)

puts "Days created"


puts "Creating transactions..."

carl_trans_0_1 = Transaction.create(wallet: carlotta_wallet, day: days_ago_0, amount_cents: 200, merchant: "Pret")
carl_trans_0_2 = Transaction.create(wallet: carlotta_wallet, day: days_ago_0, amount_cents: 300, merchant: "Eat")
carl_trans_0_3 = Transaction.create(wallet: carlotta_wallet, day: days_ago_0, amount_cents: 400, merchant: "Bakery")
carl_trans_0_4 = Transaction.create(wallet: carlotta_wallet, day: days_ago_0, amount_cents: 500, merchant: "Pharmacy")
carl_trans_1_1 = Transaction.create(wallet: carlotta_wallet, day: days_ago_1, amount_cents: 600, merchant: "Book")
carl_trans_1_2 = Transaction.create(wallet: carlotta_wallet, day: days_ago_1, amount_cents: 700, merchant: "Water")
carl_trans_1_3 = Transaction.create(wallet: carlotta_wallet, day: days_ago_1, amount_cents: 800, merchant: "Plant")
carl_trans_1_4 = Transaction.create(wallet: carlotta_wallet, day: days_ago_1, amount_cents: 900, merchant: "Plug")
carl_trans_2_1 = Transaction.create(wallet: carlotta_wallet, day: days_ago_2, amount_cents: 200, merchant: "Pret")
carl_trans_2_2 = Transaction.create(wallet: carlotta_wallet, day: days_ago_2, amount_cents: 300, merchant: "Eat")
carl_trans_2_3 = Transaction.create(wallet: carlotta_wallet, day: days_ago_2, amount_cents: 400, merchant: "Bakery")
carl_trans_2_4 = Transaction.create(wallet: carlotta_wallet, day: days_ago_2, amount_cents: 500, merchant: "Pharmacy")
carl_trans_3_1 = Transaction.create(wallet: carlotta_wallet, day: days_ago_3, amount_cents: 600, merchant: "Book")
carl_trans_3_2 = Transaction.create(wallet: carlotta_wallet, day: days_ago_3, amount_cents: 700, merchant: "Water")
carl_trans_3_3 = Transaction.create(wallet: carlotta_wallet, day: days_ago_3, amount_cents: 800, merchant: "Plant")
carl_trans_3_4 = Transaction.create(wallet: carlotta_wallet, day: days_ago_3, amount_cents: 900, merchant: "Plug")
puts "Transactions created"













