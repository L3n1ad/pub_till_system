require('minitest/autorun')
require('minitest/rg')
require_relative('../pub')
require_relative('../drink')
class PubTest < MiniTest::Test

  def setup

    @drink1 = Drink.new("beer", 3)
    @drink2 = Drink.new("wine", 3)
    @drink3 = Drink.new("cider", 3)

    @drinks = [@drink1, @drink2, @drink3]

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
end
