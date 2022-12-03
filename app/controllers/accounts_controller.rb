class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy ]

  def index
    @accounts = Account.all
  end

  def show
    @account = Account.find(params[:id])
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to accounts_path
    else
      render :edit
    end
  end

  def edit 
  end

  
  def update 
    if @account.update(account_params)
      redirect_to accounts_path
    else
      render :edit
    end
  end

  def destroy 
    # #   @account.destroy
    #     @account.update(status: "excluido")
    #   redirect_to accounts_path
  end

  private

  def set_account
    @account = account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:saldo, :number, :agency, :status,:user_id)
  end
end
