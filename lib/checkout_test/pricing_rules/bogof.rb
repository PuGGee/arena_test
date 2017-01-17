require './lib/checkout_test/pricing_rules/base'

module CheckoutTest
  module PricingRules
    class Bogof < Base
      def discount
        (applicable_products.size / 2) * unit_price
      end

      private

      def applicable_products
        products.select { |product| product.code == applicable_code }
      end

      def unit_price
        applicable_products.first && applicable_products.first.price || 0
      end

      def applicable_code
        options[:product_code]
      end
    end
  end
end
