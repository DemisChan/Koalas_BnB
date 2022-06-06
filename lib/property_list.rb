require "property"

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
    result = @database.run("INSERT INTO properties (name, address, price, description)
    VALUES ($1, $2, $3, $4) RETURNING id;",
    [property.name, property.address, property.price, property.description])
    return result[0]["id"]
  end

  def remove(index)
    @database.run("DELETE FROM properties WHERE id = $1;", [index])
  end

  def update(index, name, address, price, description)
    @database.run("UPDATE properties SET name = $2, address = $3, price = $4, description = $5
    WHERE id = $1;",
    [index, name, address, price, description])
  end

  def get(index)
    result = @database.run("SELECT * FROM properties WHERE id = $1;", [index])
    return row_to_object(result[0])
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
