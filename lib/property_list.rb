class PropertyList
  def initialize(database)
    @database = database
  end

  def list
    return @database.run("SELECT * FROM properties ORDER BY id;").map do |row|
      row_to_object(row)
    end
  end

  def add(property)
    result = @database.run("INSERT INTO properties (name, address, price, description) VALUES ($1, $2, $3, $4) RETURNING id;",
    [property.name, property.address, property.price, property.description])
    return result[0]["id"]
  end

  def remove(index)
    @database.run("DELETE FROM properties WHERE id = $1;", [index])
  end

  def update(index, name, address, price, description)
    #updates whichever field is required
  end

  def get(index) #index is an integer
    #returns the property at the specified index
  end
  
  private

  def row_to_object(row)
    return Property.new(
      row["id"],
      row["name"],
      row["address"],
      row["price"],
      row["description"]
    )
  end
end
