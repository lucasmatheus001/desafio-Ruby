require 'faker'

FactoryBot.define do 
  factory :user do
    cpf { Faker::Number.number }
    name {Faker::Name.name}
    email {Faker::Internet.email}
    password {Faker::Internet.password}
    password_confirmation {password}
    birthday {Faker::Date.birthday(min_age: 18, max_age:70)}
  end
end