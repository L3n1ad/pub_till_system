require('minitest/autorun')
require('minitest/rg')
require_relative('../customer')
require_relative('../drink')
require_relative('../pub')
require_relative('../food')


class CustomerTest < MiniTest::Test

  def setup

    @drink1 = Drink.new("beer", 3, 1)
    @drink2 = Drink.new("wine", 3, 1)
    @drink3 = Drink.new("cider", 3, 1)

    @drinks = [@drink1, @drink2, @drink3]

    @customer1 = Customer.new("Cat", 20, 22)
    @customer2 = Customer.new("Jack", 20, 12)
    @customer3 = Customer.new("Sofia", 20, 18)

    @food = Food.new("burger", 5, 1)

    @pub = Pub.new("Tower", 200, @drinks)
  end

  def test_customer_has_name
    assert_equal("Cat", @customer1.name)
  end

  def test_customer_has_wallet
    assert_equal(20, @customer1.wallet)
  end

  def test_pay_for_drink
    @customer1.pay_for_drink(@drink1)
    assert_equal(17, @customer1.wallet)
  end

  def test_customer_age
    assert_equal(22, @customer1.age)
  end

  def test_customer_drunkenness
    assert_equal(0, @customer1.drunkenness)
  end

  def test_customer_age_check__underage
    result = @customer2.customer_age_check
    refute(result)
  end

  def test_customer_age_check__18
    result = @customer3.customer_age_check
    assert(result)
  end

  def test_customer_age_check__overage
    result = @customer1.customer_age_check
    assert(result)
  end

  def test_drunkenness__over_limit
    @customer1.drunkenness = 5
    result = @customer1.drunkenness_check
    assert_equal(false, result)
  end
  def test_drunkenness__under_limit
    result = @customer1.drunkenness_check
    assert_equal(true, result)
  end
  def test_drunkenness__on_limit
    @customer1.drunkenness = 3
    result = @customer1.drunkenness_check
    assert_equal(false, result)
  end
  def test_pay_for_food
    @customer1.pay_for_food(@food)
    assert_equal(15, @customer1.wallet)
  end
end
