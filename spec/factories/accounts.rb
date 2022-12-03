require 'faker'
require 'user'
FactoryBot.define do
  factory :account do
    user = create{:user}
    user_id {user.id}
    balance {0}
    number { Faker::Number.number(digits: 10) }
    agency { Faker::Number.number(digits: 4) }
    status { 1 }
  end
end
