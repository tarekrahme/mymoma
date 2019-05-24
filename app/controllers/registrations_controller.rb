class RegistrationsController < Devise::RegistrationsController
  def create
    super
    @wallet = Wallet.new(user: resource)
    @wallet.save
  end
end
