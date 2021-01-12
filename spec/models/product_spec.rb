require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
   
    it "is valid with valid attributes" do
      @product = Product.new(
        name: "StrawBerry",
        price_cents: 0,
        quantity: 0,
        )
      @category = Category.new(name: "Fruit")
      @product.category = @category
      expect(@product).to be_valid
    end

    it "is not valid without name attribute" do
      @product = Product.new(
        price_cents: 0,
        quantity: 0,
        )
      @category = Category.new(name: "Fruit")
      @product.category = @category
      expect(@product).to_not be_valid
    end

    it "is not valid without price attribute" do
      @product = Product.new(
        name: "StrawBerry",
        quantity: 0,
        )
      @category = Category.new(name: "Fruit")
      @product.category = @category
      expect(@product).to_not be_valid
    end

    it "is not valid without quantity attribute" do
      @product = Product.new(
        name: "StrawBerry",
        price_cents: 0,
        )
      @category = Category.new(name: "Fruit")
      @product.category = @category
      expect(@product).to_not be_valid
    end

    it "is not valid without Category attribute" do
      @product = Product.new(
        name: "StrawBerry",
        price_cents: 0,
        quantity: 0,
        )
      expect(@product).to_not be_valid
    end
  end
end