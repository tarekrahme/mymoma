class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  def index
    @transactions = Transaction.all.where( day = Date.today)
    # Add transactions to Day table - A day has many transactions
  end

  def show
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
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
