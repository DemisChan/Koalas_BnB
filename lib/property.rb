class Property
  def initialize(name, location, address, price, description, id = nil)
    @name = name
    @location = location
    @address = address
    @price = price
    @description = description
    @id = id
  end

  def name
    return @name
  end
  
  def location
    return @location
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
