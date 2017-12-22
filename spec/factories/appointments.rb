FactoryGirl.define do
  factory :appointment do
    id      {Faker::Number.between(7, 12)}
    user_id {Faker::Number.between(1, 5)}
    date    {Faker::Date.forward(23)}
  end
end