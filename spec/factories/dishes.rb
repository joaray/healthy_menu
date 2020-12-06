FactoryGirl.define do
  factory :dish do
    user
    name { Faker::Food.unique.dish }
    details { Faker::Food.description }
  end
end
