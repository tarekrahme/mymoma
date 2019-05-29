class Goal < ApplicationRecord
  belongs_to :wallet
  monetize :amount_cents
  monetize :monthly_contribution_cents
  mount_uploader :picture, PhotoUploader
end
