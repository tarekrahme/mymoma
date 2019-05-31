class Goal < ApplicationRecord
  belongs_to :wallet
  monetize :amount_cents
  monetize :monthly_contribution_cents
  mount_uploader :picture, PhotoUploader

  # before_validation :update_monthly_contribution, if: :will_save_change_to_goal?

end
