class Wallet < ApplicationRecord
  belongs_to :user
  has_many :goals
  has_many :transactions
  before_action :set_wallet, only: [:show]

  def show
  end

  private

  def set_wallet
    @wallet = Wallet.find(params[:id])
  end
end
