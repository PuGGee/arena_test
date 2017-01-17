require './spec/test_helper'

require './lib/checkout_test/checkout'

class MockRule < Struct.new(:discount)
end

describe CheckoutTest::Checkout do

  describe "no pricing rules" do

    let(:checkout) { described_class.new }

    describe "#scan" do
      describe "when item is valid" do
        it "should add the item to the basket" do
          checkout.scan(products.first)
          expect(checkout.count).to equal 1
        end
      end
    end

    describe "#total" do
      it "should sum the price items in the basket" do
        checkout.scan(products.first)
        checkout.scan(products.last)
        expect(checkout.total).to equal 14.34
      end
    end
  end

  describe "#discount" do

    let(:checkout) { described_class.new([MockRule.new(3), MockRule.new(5)]) }

    it "should sum the discount for each rule" do
      expect(checkout.discount).to equal 8
    end
  end
end
