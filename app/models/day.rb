class Day < ApplicationRecord
  belongs_to :goal
  belongs_to :wallet
  has_many :transactions
end
