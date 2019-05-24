class WalletsController < ApplicationController
  before_action :set_wallet, only: [:show]

  def show
  end

  private

  def set_wallet
    @wallet = Wallet.find(params[:id])
  end
end
