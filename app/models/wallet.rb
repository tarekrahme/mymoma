class Wallet < ApplicationRecord
  belongs_to :user
  has_one :goal,dependent: :destroy
  has_many :transactions
  has_many :days, dependent: :destroy
  monetize :daily_income_cents
  monetize :savings_cents
  monetize :fixed_cost_cents
  monetize :monthly_income_cents
end
