class Product < ApplicationRecord
  has_many :ingredients, dependent: :restrict_with_error
  has_many :dishes, through: :ingredients

  validates :name, presence: true, uniqueness: true
end
