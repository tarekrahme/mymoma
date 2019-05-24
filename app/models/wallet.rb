class Wallet < ApplicationRecord
  belongs_to :user
  has_one :goal,dependent: :destroy
  has_many :transactions
  has_many :days, dependent: :destroy
end
