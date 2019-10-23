require('minitest/autorun')
require('minitest/rg')
require_relative('../customer')
require_relative('../drink')
require_relative('../pub')

class CustomerTest < MiniTest::Test

  def setup

    @drink1 = Drink.new("beer", 3)
    @drink2 = Drink.new("wine", 3)
    @drink3 = Drink.new("cider", 3)

    @drinks = [@drink1, @drink2, @drink3]

    @customer = Customer.new("Cat", 20)

    @pub = Pub.new("Tower", 200, @drinks)
  end

  def test_customer_has_name
    assert_equal("Cat", @customer.name)
  end

  def test_customer_has_wallet
    assert_equal(20, @customer.wallet)
  end

  def test_pay_for_drink
    @customer.pay_for_drink(@drink1)
    assert_equal(17, @customer.wallet)
  end

  def test_buy_drink
   @customer.buy_drink(@drink1, @pub)
   assert_equal(17, @customer.wallet)
   assert_equal(203, @pub.till)
  end

end
