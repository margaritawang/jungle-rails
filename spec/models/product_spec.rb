require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "should be valid when all values are given" do 
      category = Category.new()
      category.save!
      product = Product.new(name: 'a', price: 1, quantity: 1, category_id: category.id)
      expect(product).to(be_valid)
    end
    
    it "should be invalid with no value for name" do 
      category = Category.new()
      category.save!
      product = Product.new(price: 1, quantity: 1, category_id: category.id)
      expect(product).to_not(be_valid)
      expect(product.errors[:name]).to(include("can't be blank"))
    end

    it "should be invalid with no value for price" do 
      category = Category.new()
      category.save!
      product = Product.new(name: 'a', quantity: 1, category_id: category.id)
      expect(product).to_not(be_valid)
      expect(product.errors[:price]).to(include("can't be blank"))
    end

    it "should be invalid with no value for quantity" do 
      category = Category.new()
      category.save!
      product = Product.new(name: 'a', price: 1, category_id: category.id)
      expect(product).to_not(be_valid)
      expect(product.errors[:quantity]).to(include("can't be blank"))
    end

    it "should be invalid with no value for category" do 
      category = Category.new()
      category.save!
      product = Product.new(name: 'a', price: 1, quantity: 1)
      expect(product).to_not(be_valid)
      expect(product.errors[:category]).to(include("can't be blank"))
    end
  end
end
