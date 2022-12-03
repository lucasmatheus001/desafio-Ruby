class User < ApplicationRecord
  has_many :accounts, dependent: :destroy
  after_create :create_account

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # validations
  validates :cpf, :name, :email,:birthday, presence: true
  validates :cpf, uniqueness: true
  validates :email, uniqueness: true


  def create_account
    loop do
      account_number = rand(1000000..9999999)
      unless Account.exists?(number: account_number)
        Account.create(user_id: self.id, number: account_number, agency: 2448, balance: 0.0)
        break
      end
    end
  end
end
