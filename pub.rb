class Pub
  attr_reader :name, :till, :drinks

  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks
  end

  def add_money_to_till(drink)
    price = drink.price
    @till += price
  end
end
