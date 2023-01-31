require 'rails_helper'

RSpec.describe Product, type: :model do
describe 'Validations' do
    before do    
        @category = Category.new(id:1, name:"Home Office")
        @product = Product.new(name:"LED work lamp", price_cents: 2499, quantity: 13, category: @category)
    end

    it "is valid when attributes are valid" do
        expect(@product).to be_valid
    end

    it "is invalid without a name " do
        @product.name = nil
        @product.valid? 
        expect(@product.errors.full_messages).to_not be_empty
    end
    it "is invalid without a price" do
        @product.price_cents = nil
        @product.valid? 
        expect(@product.errors.full_messages).to_not be_empty
    end
    it "is invalid without a quantity" do
        @product.quantity = nil
        @product.valid? 
        expect(@product.errors.full_messages).to_not be_empty
    end
    it "is invalid without a category" do
        @product.category = nil
        @product.valid?
        expect(@product.errors.full_messages).to_not be_empty
    end
end
end