require "helpers/database_helpers"
require "booking_list"
require "booking"
require "property"
require "property_list"

RSpec.describe BookingList do
  def empty_and_return_bookings
    DatabaseHelpers.clear_table("bookings")
    return DatabaseHelpers.test_db_connection
  end

  def empty_and_return_properties
    DatabaseHelpers.clear_table("properties")
    return DatabaseHelpers.test_db_connection
  end

  it "start with an empty table" do
    bookings_database = empty_and_return_bookings
    booking_list = BookingList.new(bookings_database)
    expect(booking_list.list).to eq []
  end

  it "adds bookings and lists them out again" do
    bookings_database = empty_and_return_bookings
    booking_list = BookingList.new(bookings_database)

    properties_database = empty_and_return_properties
    property_list = PropertyList.new(properties_database)

    property_list.add(Property.new(
      "Rainbow Lodge",
      "6 Rue du Gue, Rueil-Malmaison, France",
      60,
      "Suburban property"
		))

    properties = property_list.list
		
    property_id = properties[0].id
    booking_list.add(Booking.new(
      "Ana",
			"2021-09-22",
			"2021-10-13",
			property_id
    ))

    booking = booking_list.list
    expect(booking.length).to eq 1
    expect(booking[0].username).to eq "Ana"
    expect(booking[0].start_date).to eq "2021-09-22"
    expect(booking[0].end_date).to eq "2021-10-13"
    expect(booking[0].prop_id).to eq property_id
  end

  it "removes booking" do
    bookings_database = empty_and_return_bookings
    booking_list = BookingList.new(bookings_database)

    properties_database = empty_and_return_properties
    property_list = PropertyList.new(properties_database)

    rainbow = property_list.add(Property.new(
      "Rainbow Lodge",
      "6 Rue du Gue, Rueil-Malmaison, France",
      60,
      "Suburban property"
    ))

    properties = property_list.list
		
    property_id = properties[0].id
		
    emma = booking_list.add(Booking.new(
      "Emma",
			"2021-09-22",
			"2021-10-13",
			property_id
    ))

    ana = booking_list.add(Booking.new(
      "Ana",
			"2022-04-19",
			"2022-05-01",
			property_id
    ))

    kelvin = booking_list.add(Booking.new(
      "Kelvin",
			"2021-05-28",
			"2021-05-29",
			property_id
    ))
      
    booking_list.remove(ana)

    booking = booking_list.list
    expect(booking.length).to eq 2
    expect(booking[0].username).to eq "Emma"
    expect(booking[1].username).to eq "Kelvin"
  end

  it "updates booking" do
    bookings_database = empty_and_return_bookings
    booking_list = BookingList.new(bookings_database)

    properties_database = empty_and_return_properties
    property_list = PropertyList.new(properties_database)

    rainbow = property_list.add(Property.new(
      "Rainbow Lodge",
      "6 Rue du Gue, Rueil-Malmaison, France",
      60,
      "Suburban property"
    ))

    properties = property_list.list
		
    property_id = properties[0].id

    emma = booking_list.add(Booking.new(
      "Emma",
			"2021-09-22",
			"2021-10-13",
			property_id
    ))

    ana = booking_list.add(Booking.new(
      "Ana",
			"2022-04-19",
			"2022-05-01",
			property_id
    ))

    kelvin = booking_list.add(Booking.new(
      "kevin",
			"2021-05-28",
			"2021-05-29",
			property_id
    ))
    
    booking_list.update(kelvin,
      "Kelvin",
			"2021-05-28",
			"2021-05-29",
			property_id
    )

    bookings = booking_list.list
    expect(bookings[0].username).to eq "Emma"
    expect(bookings[1].username).to eq "Ana"
    expect(bookings[2].username).to eq "Kelvin"
  end

  it "gets a single booking" do
    bookings_database = empty_and_return_bookings
    booking_list = BookingList.new(bookings_database)

    properties_database = empty_and_return_properties
    property_list = PropertyList.new(properties_database)

    rainbow = property_list.add(Property.new(
      "Rainbow Lodge",
      "6 Rue du Gue, Rueil-Malmaison, France",
      60,
      "Suburban property"
    ))

    properties = property_list.list
		
    property_id = properties[0].id

    emma = booking_list.add(Booking.new(
      "Emma",
			"2021-09-22",
			"2021-10-13",
			property_id
    ))

    ana = booking_list.add(Booking.new(
      "Ana",
			"2022-04-19",
			"2022-05-01",
			property_id
    ))

    kelvin = booking_list.add(Booking.new(
      "Kelvin",
			"2021-05-28",
			"2021-05-29",
			property_id
    ))
    
    bookings = booking_list.list
    expect(bookings[1].username).to eq "Ana"
  end
end
