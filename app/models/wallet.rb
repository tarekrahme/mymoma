class Wallet < ApplicationRecord
  belongs_to :user
  has_one :goal
  has_many :transactions
  has_many :days
end
