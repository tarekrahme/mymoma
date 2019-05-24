class Wallet < ApplicationRecord
  belongs_to :user
  has_many :goals
  has_many :transactions
end
