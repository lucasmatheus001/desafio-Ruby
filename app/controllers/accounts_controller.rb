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

  def deposito
    
  end

  def create_deposito
    @account = Account.find(params[:id])
    @account.deposit(params[:value].to_d)
    redirect_to dashboard_index_path
  end

  def transfer
  end

  def create_transfer
    @account = Account.find(params[:id])
    destiny_account = Account.find_by(number: params[:number])
    if destiny_account.present?
      @account.transfer(params[:value].to_d, destiny_account)
      redirect_to dashboard_index_path
    else
      render :transfer
    end
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:saldo, :number, :agency, :status,:user_id)
  end
end
