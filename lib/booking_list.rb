class BookingList
  def initialize(database)
    @database = database
  end

  def list
    return @database.run("SELECT * FROM bookings ORDER BY id;").map do |row|
      row_to_object(row)
    end
  end

	def add(booking)
		result = @database.run("INSERT INTO bookings (username, start_date, end_date, property_id) VALUES ($1, $2, $3, $4) RETURNING id;",
		[booking.username, booking.start_date, booking.end_date, booking.prop_id])
		return result[0]["id"]
	end

  private 

	def row_to_object(row)
		return Booking.new(
			row["username"], 
			row["start_date"],
			row["end_date"],
			row["property_id"],
			row["id"]
		)
	end
end
