class Property
  def initialize(name, address, price, description, id = nil)
    @name = name
    @address = address
    @price = price
    @description = description
    @id = id
  end

  def name
    return @name
  end

  def address
    return @address
  end

  def price
    return @price
  end

  def description
    return @description
  end

  def id
    return @id
  end
end
