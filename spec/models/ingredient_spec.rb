require 'rails_helper'

describe Ingredient do
  it 'has a valid factory' do
    expect(build(:product)).to be_valid
  end

  it 'is invalid without the product' do
    ingredient = build(:ingredient, product: nil)
    ingredient.valid?
    expect(ingredient.errors[:product]).to include('must exist')
  end

  it 'is invalid without the dish' do
    ingredient = build(:ingredient, dish: nil)
    ingredient.valid?
    expect(ingredient.errors[:dish]).to include('must exist')
  end

  it 'is invalid without the unit' do
    ingredient = build(:ingredient, unit: nil)
    ingredient.valid?
    expect(ingredient.errors[:unit]).to include("can't be blank")
  end

  it 'with unit out of scope raises an error' do
    expect{ build(:ingredient, unit: 'aaa') }.to raise_error(ArgumentError)
  end
end
