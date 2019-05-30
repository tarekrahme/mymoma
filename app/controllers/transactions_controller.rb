class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  def index
    @transactions = Transaction.joins(:day).where(days: { date: Date.today })
  end

  def show
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(amount_cents: transaction_params["amount_cents"])
    @transaction.merchant = transaction_params["merchant"]
    @transaction.wallet = current_user.wallet
    day = Day.find_by(date: transaction_params["day"]) || Day.create(date: transaction_params["day"], wallet: current_user.wallet, goal: current_user.wallet.goal)
    @transaction.day = day
    if @transaction.save

      redirect_to transactions_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @transaction = Transaction.update(transaction_params)
    if @transaction.save
      redirect_to transaction_path(@transaction)
    else
      render :edit
    end
  end

  def destroy
    @transaction.destroy
    redirect_to transactions_path
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount_cents, :merchant, :day)
  end

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end
end
