require('minitest/autorun')
require('minitest/rg')
require_relative('../drink')

class DrinkTest < MiniTest::Test

def test_drink_has_name
  @drink = Drink.new("beer", 3)
  assert_equal("beer", @drink.name)
end

def test_drink_has_price
  @drink = Drink.new("beer", 3)
  assert_equal(3, @drink.price)
end

end
