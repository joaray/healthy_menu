require 'rails_helper'

describe Product do
  it 'has a valid factory' do
    expect(build(:product)).to be_valid
  end

  it 'is invalid without the name' do
    product = build(:product, name: nil)
    product.valid?
    expect(product.errors[:name]).to include("can't be blank")
  end

  it 'is invalid with a duplicate name' do
    create(:product, name: 'test_product')
    product = build(:product, name: 'test_product')
    product.valid?
    expect(product.errors[:name]).to include('has already been taken')
  end
end
