class Property
  def initialize( id = nil, name, address, price, description)
    @id = id
    @name = name
    @address = address
    @price = price
    @description = description
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
