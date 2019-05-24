class Goal < ApplicationRecord
  belongs_to :wallet
  belongs_to :user
  monetize :amount_cents
end
