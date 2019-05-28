class WalletsController < ApplicationController
  before_action :set_wallet, only: [:show]

  def show
  end

  def tell_us_a_bit_more
    @wallet = current_user.wallet
  end

  def recommendations
    @wallet = current_user.wallet
    # raise
    # @wallet.update(wallet_params)
  end

  private

  def set_wallet
    @wallet = current_user.wallet
  end

  def wallet_params
    params.require(:wallet).permit(:daily_income, :savings, :fixed_cost)
  end
end
