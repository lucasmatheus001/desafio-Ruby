class Account < ApplicationRecord
  belongs_to :user

  enum status: { inactive: 0, active: 1}

  # validations
  validates :number,:agency, :status, presence: true
  validates :number, uniqueness: true

  #methods
  def check_balance
    self.balance = self.user.balance
  end

  def check_agency
    self.agency = self.user.agency
  end

  def check_status
    self.status = self.user.status
  end

  def check_user
    self.user = User.find(self.number)
  end

  def deposit(value)
    if value > 0
      self.balance += value
      save
    else
      raise "Valor inválido"
    end
  end

  def transfer(value, account)
    if self.balance >= value && self.id != account.id
      update(balance: self.balance -= value)
      account.update(balance: account.balance += value)
    else
      raise "Saldo insuficiente"
    end
  end

  def statement_by_period(initial_date, final_date)
    Statement.where(account_id: self.id, date: initial_date..final_date)
  end
  
  
end
