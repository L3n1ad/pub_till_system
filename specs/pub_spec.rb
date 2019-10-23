require('minitest/autorun')
require('minitest/rg')
require_relative('../pub')
require_relative('../drink')
require_relative('../customer')
require_relative('../food')

class PubTest < MiniTest::Test

  def setup

    @drink1 = Drink.new("beer", 3, 1)
    @drink2 = Drink.new("wine", 3, 1)
    @drink3 = Drink.new("cider", 3, 1)

    @stock = Hash.new(@drink1 => 5, @drink2 => 5)
    @stock = Hash.new(0)

    @stock[@drink1] = 10
    @stock[@drink2] = 10
    @stock[@drink3] = 10

    @food = Food.new("burger", 5, 1)

    @customer1 = Customer.new("Cat", 20, 22)
    @customer2 = Customer.new("Jack", 20, 12)
    @customer3 = Customer.new("Sofia", 20, 18)

    @pub = Pub.new("Tower", 200, @stock)
  end

  def test_pub_has_name
    assert_equal("Tower", @pub.name)
  end

  def test_pub_has_till
    assert_equal(200, @pub.till)
  end
  def test_pub_has_stock
    assert_equal(@stock, @pub.stock)
  end

  def test_add_money_to_till
    @pub.add_money_to_till(@drink1)
    assert_equal(203, @pub.till)
  end

  def test_buy_drink
   @pub.buy_drink(@drink1, @customer1)
   assert_equal(17, @customer1.wallet)
   assert_equal(203, @pub.till)
  end

  def test_add_alcohol_level_to_drunkenness
    @pub.buy_drink(@drink1, @customer1)
    assert_equal(1, @customer1.drunkenness)
  end

  def test_buy_drink__right_age_not_drunk
    result = @pub.buy_drink(@drink1, @customer1)
    assert_equal("You bought a drink", result)
  end

  def test_buy_drink__right_age_too_drunk
    @customer1.drunkenness = 5
    result = @pub.buy_drink(@drink1, @customer1)
    assert_equal("Sorry, no drink!", result)

  end
  def test_buy_drink__under_age_too_drunk
    @customer2.drunkenness = 5
    result = @pub.buy_drink(@drink1, @customer2)
    assert_equal("Sorry, no drink!", result)
  end
  def test_buy_drink__under_age_not_drunk
    result = @pub.buy_drink(@drink1, @customer2)
    assert_equal("Sorry, no drink!", result)
  end

  def test_buy_food
   @customer1.drunkenness = 2
   @pub.buy_food(@food, @customer1)
   assert_equal(15, @customer1.wallet)
   assert_equal(205, @pub.till)
   assert_equal(1, @customer1.drunkenness)
  end

  def test_pub_stock_value
    result = @pub.pub_stock_value
    assert_equal(90, result)
  end
end
