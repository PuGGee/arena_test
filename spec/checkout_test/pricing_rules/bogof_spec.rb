require './spec/test_helper'

require './lib/checkout_test/pricing_rules/bogof'

describe CheckoutTest::PricingRules::Bogof do

  describe "#discount" do
    describe "when two applicable products in basket" do

      let(:rule) { described_class.new([products.first, products.first], {product_code: 'SF1'}) }

      it "should give the correct discount" do
        expect(rule.discount).to equal 3.11
      end
    end

    describe "when three applicable products in basket" do

      let(:rule) { described_class.new([products.first, products.first, products.first], {product_code: 'SF1'}) }

      it "should give the correct discount" do
        expect(rule.discount).to equal 3.11
      end
    end

    describe "when four applicable products in basket" do

      let(:rule) { described_class.new([products.first, products.first, products.first, products.first], {product_code: 'SF1'}) }

      it "should give the correct discount" do
        expect(rule.discount).to equal 6.22
      end
    end
  end
end
