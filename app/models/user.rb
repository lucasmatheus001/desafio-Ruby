class User < ApplicationRecord
  
  # validations
  validates :cpf, :name, :email,:birthday, presence: true
  validates :cpf, uniqueness: true
  validates :email, uniqueness: true
  



end
