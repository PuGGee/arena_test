require 'yaml'
require 'pry-byebug'
require './lib/checkout_test/models/product'

def products
  @products ||= YAML.load_file('spec/data/products.yml').map do |product_data|
    CheckoutTest::Models::Product.new(
      product_data['code'],
      product_data['name'],
      product_data['price'],
      product_data['currency']
    )
  end
end
