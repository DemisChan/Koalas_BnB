require "helpers/database_helpers"
require "booking_list"

RSpec.describe BookingList do
  def empty_and_return_database
    DatabaseHelpers.clear_table("bookings")
    return DatabaseHelpers.test_db_connection
  end

  it "start with an empty table" do
    database = empty_and_return_database
    booking_list = BookingList.new(database)
    expect(booking_list.list).to eq []
  end
end
