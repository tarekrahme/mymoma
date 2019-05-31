class Day < ApplicationRecord
  belongs_to :goal, optional: true
  belongs_to :wallet
  has_many :transactions
end
