class WalletsController < ApplicationController
  before_action :set_wallet, only: [:show, :update, :recommendations]

  def show
  end

  def tell_us_a_bit_more
    @wallet = current_user.wallet
  end

  def update
    @wallet.update(wallet_params)
    redirect_to tell_us_a_bit_more_wallets_path
  end

  def recommendations
    @available_spend = @wallet.daily_income_cents - @wallet.savings_cents - @wallet.fixed_cost_cents
    @wallet = current_user.wallet
  end

  private

  def set_wallet
    @wallet = current_user.wallet
  end

  def wallet_params
    # params.require(:wallet).permit(:daily_income, :savings, :fixed_cost)
    params.require(:wallet).permit(:daily_income_cents, :savings_cents, :fixed_cost_cents)
  end
end
