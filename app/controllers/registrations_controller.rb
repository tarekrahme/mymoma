class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    @wallet = Wallet.new(user: resource)
    @wallet.save
    tell_us_a_bit_more_wallets_path(resource.wallet)
  end
end
