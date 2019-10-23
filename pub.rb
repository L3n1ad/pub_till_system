class Pub
  attr_reader :name, :till, :stock
  attr_accessor :stock

  def initialize(name, till, stock)
    @name = name
    @till = till
    @stock = stock
  end

  def add_money_to_till(drink)
    @till += drink.price
  end

  def buy_drink(drink, customer)
    if customer.customer_age_check && customer.drunkenness_check
      customer.pay_for_drink(drink)
      add_money_to_till(drink)
      customer.drunkenness += drink.alcohol_level
      return "You bought a drink"
    else
      return "Sorry, no drink!"
    end
  end

  def buy_food(food, customer)
      customer.pay_for_food(food)
      add_money_to_till(food)
      customer.drunkenness -= food.rejuvenation_level
  end

  def pub_stock_value
    total_value = 0
    p @stock.length
    @stock.each do |drink, amount|
      # p drink.price
      # total_value += drink.price * amount
      p drink
      p amount
    end
    return total_value
  end


end
