class Goal < ApplicationRecord
  belongs_to :wallet
  monetize :amount_cents
  mount_uploader :picture, PhotoUploader
end
