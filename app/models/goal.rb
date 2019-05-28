class Goal < ApplicationRecord
  belongs_to :wallet
  monetize :amount_cents
  monetize :monthly_contribution_cents
end
