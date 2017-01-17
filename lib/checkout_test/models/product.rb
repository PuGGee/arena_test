module CheckoutTest
  module Models
    class Product < Struct.new(:code, :name, :price, :currency)
    end
  end
end
