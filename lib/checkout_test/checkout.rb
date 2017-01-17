module CheckoutTest
  class Checkout
    include Enumerable

    def each(*args, &block)
      products.each(*args, &block)
    end

    def scan(product)
      products << product
    end

    def total
      map(&:price).inject(0, &:+)
    end

    private

    def products
      @products ||= []
    end
  end
end
