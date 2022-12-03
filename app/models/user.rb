class User < ApplicationRecord
  has_many :accounts, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # validations
  validates :cpf, :name, :email,:birthday, presence: true
  validates :cpf, uniqueness: true
  validates :email, uniqueness: true
  



end
