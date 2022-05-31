class PropertyList
  def initialize(database)
    @database = database
  end

  def list
    return @database.run("SELECT * FROM properties ORDER BY id;").map do |row|
      row_to_object(row)
    end
  end

  def add(property) #property is an entity of Property class
    #adds a new property to PropertyList
  end

  def remove(index) #index is an integer
    #deletes property at specified index
  end

  def update(index, name, location, address, price, description)
    #updates whichever field is required
  end

  def get(index) #index is an integer
    #returns the property at the specified index
  end
  
  private

  def row_to_object(row)
    #returns the full advert
  end
end
