FactoryGirl.define do
  factory :ingredient do
    dish
    product
    unit { Ingredient.units.keys.sample }
    quantity { [1, 2, 3].sample }
  end
end
