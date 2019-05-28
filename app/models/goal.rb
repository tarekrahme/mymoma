class Goal < ApplicationRecord
  belongs_to :wallet
  monetize :amount_cents
end
