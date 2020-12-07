FactoryGirl.define do
  factory :product do
    name { Faker::Food.unique.ingredient }
  end
end
