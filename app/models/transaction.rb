class Transaction < ApplicationRecord
  belongs_to :wallet
  belongs_to :day
  accepts_nested_attributes_for :day
end
