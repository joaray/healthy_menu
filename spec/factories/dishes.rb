FactoryGirl.define do
  factory :dish do
    user
    name { Faker::Food.unique.dish }
    prep_time { 10 }
    cook_time { 20 }
    servings { 4 }
    description { Faker::Food.description }
  end
end
