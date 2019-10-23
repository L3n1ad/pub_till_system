require('minitest/autorun')
require('minitest/rg')
require_relative('../food')

class FoodTest < MiniTest::Test

  def setup
    @food = Food.new("burger", 5, 1)
  end

  def test_food_has_name
    assert_equal("burger", @food.name)
  end

  def test_food_has_price
    assert_equal(5, @food.price)
  end

  def test_food_rejuvention_level
    assert_equal(1, @food.rejuvenation_level)
  end

end
