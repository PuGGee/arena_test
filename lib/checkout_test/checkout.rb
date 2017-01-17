module CheckoutTest
  class Checkout < Struct.new(:pricing_rules)
    include Enumerable

    def initialize(pricing_rules = [])
      super
    end

    def each(*args, &block)
      products.each(*args, &block)
    end

    def scan(product)
      products << product
    end

    def total
      map(&:price).inject(0, &:+) - discount
    end

    def discount
      pricing_rules.map(&:discount).inject(0, &:+)
    end

    private

    def products
      @products ||= []
    end
  end
end
