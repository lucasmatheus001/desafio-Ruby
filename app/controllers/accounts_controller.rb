class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy ]
  before_action :can_search, only: %i(show)


  def index
    @accounts = Account.all
  end

  def show
    authorize @account
    @account = Account.find(params[:id])
    @operations = []
    @operations = Operation.where(created_at: Time.parse(params[:start_date])..Time.parse(params[:end_date]))
                           .where("origin_id = ? OR destiny_id = ?", @account.id, @account.id) if @can_search
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
    @account.update(status: ":inactive")
    redirect_to accounts_path
  end

  def deposit
    
  end

  def create_deposit
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

  def withdraw
  end

  def create_withdraw
    @account = Account.find(params[:id])
    @account.withdraw(params[:value].to_d)
    redirect_to dashboard_index_path
  end



  private

  def set_account
    @account = Account.find(params[:id])
    authorize @account
  end

  def account_params
    params.require(:account).permit(:saldo, :number, :agency, :status,:user_id)
  end

  def can_search
    @can_search = false
    return unless (params[:start_date].present? && params[:end_date].present?)
    @can_search = (Time.parse(params[:start_date]) rescue nil).present? && (Time.parse(params[:end_date]) rescue nil).present?
    if @can_search
      @can_search = Time.parse(params[:start_date]) < Time.parse(params[:end_date])
    end
  end
end
