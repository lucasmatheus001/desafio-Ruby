class Account < ApplicationRecord
  belongs_to :user
  has_many :operations_origin,class_name: 'Operation', foreign_key: :origin_id
  has_many :operations_destiny,class_name: 'Operation', foreign_key: :destiny_id

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
      Operation.create(kind: :deposit, value: value, destiny_id: self.id)
    else
      raise "Valor inválido"
    end
  end

  def transfer(value, account)
    if self.balance >= value && self.id != account.id
      update(balance: self.balance -= value)
      account.update(balance: account.balance += value)
      Operation.create(kind: :transfer, value: value, origin_id: self.id, destiny_id: account.id)
    else
      raise "Saldo insuficiente"
    end
  end

  def withdraw(value)
    if self.balance >= value
      self.balance -= value
      save
      Operation.create(kind: :withdraw, value: value, origin_id: self.id)
    else
      raise "Saldo insuficiente"
    end
  end

  def statement_by_period(initial_date, final_date)
    Statement.where(account_id: self.id, date: initial_date..final_date)
  end
  
end
