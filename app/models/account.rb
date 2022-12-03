class Account < ApplicationRecord
  belongs_to :user

  enum status: { inactive: 0, active: 1}

  # validations
  validates :number,:agency, :status, presence: true
  validates :number, uniqueness: true
  
end
