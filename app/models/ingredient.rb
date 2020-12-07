class Ingredient < ApplicationRecord
  belongs_to :product
  belongs_to :dish

  validates :unit, :quantity, presence: true

  enum unit: {
    g: 10,
    kg: 20,
    ml: 30,
    l: 40,
    cup: 50,
    spoon: 60,
    tea_spoon: 70
  }
end
