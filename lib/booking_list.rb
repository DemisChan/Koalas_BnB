class BookingList
  def initialize(database)
    @database = database
  end

  def list
    return @database.run("SELECT * FROM bookings ORDER BY id;").map do |row|
      row_to_object(row)
    end
  end

	private 

	def row_to_object(row)
		return Booking.new(
			row["username"], 
			row["start_date"],
			row["end_date"],
			row["prop_id"],
			row["id"]
		)
	end
end
