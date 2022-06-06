require "booking"
require "property"

RSpec.describe Booking do
  it "constructs without an ID" do
    property = Property.new(
      "Rainbow Lodge",
      "6 Rue du Gue, Rueil-Malmaison, France",
      60,
      "Suburban property"
		)
    property_id = property.id
    
    booking = Booking.new(
      "Ana",
			2021 - 9 - 22,
			2021 - 10 - 13,
			property_id
    )

    expect(booking.username).to eq "Ana"
    expect(booking.start_date).to eq 2021 - 9 - 22
    expect(booking.end_date).to eq 2021 - 10 - 13
    expect(booking.prop_id).to eq property_id
  end

  it "constructs with an ID" do
    property = Property.new(
      "Rainbow Lodge",
      "6 Rue du Gue, Rueil-Malmaison, France",
      60,
      "Suburban property"
		)

    property_name = property.name
    
    booking = Booking.new(
      "Ana",
			2021 - 9 - 22,
			2021 - 10 - 13,
			property_name,
      5
    )

    expect(booking.username).to eq "Ana"
    expect(booking.start_date).to eq 2021 - 9 - 22
    expect(booking.end_date).to eq 2021 - 10 - 13
    expect(booking.prop_id).to eq "Rainbow Lodge"
    expect(booking.book_id).to eq 5
  end
end
  