require('minitest/autorun')
require('minitest/rg')
require_relative('../drink')

class DrinkTest < MiniTest::Test

  def setup
    @drink = Drink.new("beer", 3, 1)
  end

  def test_drink_has_name
    assert_equal("beer", @drink.name)
  end

  def test_drink_has_price
    assert_equal(3, @drink.price)
  end

  def test_drink_alcohol_level
    assert_equal(1, @drink.alcohol_level)
  end

end
