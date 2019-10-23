class Pub
  attr_reader :name, :till, :drinks

  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks
  end

  def add_money_to_till(drink)
    @till += drink.price
  end

  def buy_drink(drink, customer)
    if customer.customer_age_check == true
      customer.pay_for_drink(drink)
      add_money_to_till(drink)
      customer.drunkenness += drink.alcohol_level
    else
      return "Sorry, underaged"
    end
  end


end
