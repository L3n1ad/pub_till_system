require('minitest/autorun')
require('minitest/rg')
require_relative('../pub')
require_relative('../drink')
require_relative('../customer')

class PubTest < MiniTest::Test

  def setup

    @drink1 = Drink.new("beer", 3, 1)
    @drink2 = Drink.new("wine", 3, 1)
    @drink3 = Drink.new("cider", 3, 1)

    @drinks = [@drink1, @drink2, @drink3]

    @customer1 = Customer.new("Cat", 20, 22)
    @customer2 = Customer.new("Jack", 20, 12)
    @customer3 = Customer.new("Sofia", 20, 18)

    @pub = Pub.new("Tower", 200, @drinks)
  end

  def test_pub_has_name
    assert_equal("Tower", @pub.name)
  end

  def test_pub_has_till
    assert_equal(200, @pub.till)
  end
  def test_pub_has_drinks
    assert_equal(@drinks, @pub.drinks)
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
    p @customer1
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
end
