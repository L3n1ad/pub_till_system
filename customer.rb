class Customer

  attr_reader :name, :wallet

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
  end

  def pay_for_drink(drink)
    price = drink.price
    @wallet -= price
  end

  def buy_drink(drink, pub)
    pay_for_drink(drink)
    pub.add_money_to_till(drink)
  end
end
