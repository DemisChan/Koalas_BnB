class Booking
	def initialize(username, start_date, end_date, prop_id, id = nil)
    @username = username
    @start_date = start_date
    @end_date = end_date
    @prop_id = prop_id
    @id = id
	end

  def username
    return @username
  end

  def start_date
    return @start_date
  end

  def end_date
    return @end_date
  end

  def prop_id
    return @prop_id
  end

  def id
    return @id
  end
end
