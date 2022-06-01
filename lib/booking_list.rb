class BookingList
  def initialize(database)
    @database = database
  end

  def list
    return @database.run("SELECT * FROM bookings ORDER BY id;").map do |row|
      row_to_object(row)
    end
  end
end
