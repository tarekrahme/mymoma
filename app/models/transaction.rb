class Transaction < ApplicationRecord
  belongs_to :wallet
  belongs_to :user, through: :wallet
end
