require "helpers/database_helpers"
require "property"
require "property_list"

RSpec.describe PropertyList do
  def empty_and_return_database
    DatabaseHelpers.clear_table("properties")
    return DatabaseHelpers.test_db_connection
  end

  it "start with an empty table" do
    database = empty_and_return_database
    property_list = PropertyList.new(database)
    expect(property_list.list).to eq []
  end

  it "adds properties and lists them out again" do
    database = empty_and_return_database
    property_list = PropertyList.new(database)
    property_list.add(Property.new(
      "Rainbow Lodge",
      "6 Rue du Gue, Rueil-Malmaison, France",
      60,
      "Beachfront property"
    ))

    property = property_list.list

    expect(property.length).to eq 1
    expect(property[0].name).to eq "Rainbow Lodge"
    expect(property[0].address).to eq "6 Rue du Gue, Rueil-Malmaison, France"
    expect(property[0].price).to eq "60"
    expect(property[0].description).to eq "Beachfront property"
  end
end
