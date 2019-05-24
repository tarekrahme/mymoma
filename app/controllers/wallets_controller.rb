class WalletsController < ApplicationController
  before_action :set_wallet, only: [:show]

  def show
  end

  private

  def set_wallet
    @wallet = current_user.wallet
  end
end
