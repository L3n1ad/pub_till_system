class Customer

  attr_reader :name, :wallet, :age
  attr_accessor :drunkenness

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drunkenness = 0
  end

  def pay_for_drink(drink)
    @wallet -= drink.price
  end

  def customer_age_check
    return @age >= 18
  end


end
