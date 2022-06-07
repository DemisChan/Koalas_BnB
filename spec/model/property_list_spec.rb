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
      "Suburban property"
    ))

    property = property_list.list
    p property[0]
    expect(property.length).to eq 1
    expect(property[0].name).to eq "Rainbow Lodge"
    expect(property[0].address).to eq "6 Rue du Gue, Rueil-Malmaison, France"
    expect(property[0].price).to eq "60"
    expect(property[0].description).to eq "Suburban property"
  end

  it "removes properties" do
    database = empty_and_return_database
    property_list = PropertyList.new(database)

    rainbow = property_list.add(Property.new(
      "Rainbow Lodge",
      "6 Rue du Gue, Rueil-Malmaison, France",
      60,
      "Suburban property"
    ))
    sunshine = property_list.add(Property.new(
      "Sunshine Cottage",
      "7 The Promenade, Porthmadog, Wales",
      50,
      "Beachfront property"
    ))
    honeysuckle = property_list.add(Property.new(
      "Honeysuckle Bungalow",
      "72 Stewart Place, Ware, England",
      90,
      "Brilliant views"
    ))

    property_list.remove(sunshine)

    properties = property_list.list
    expect(properties.length).to eq 2
    expect(properties[0].name).to eq "Rainbow Lodge"
    expect(properties[1].name).to eq "Honeysuckle Bungalow"
  end

  it "updates properties" do
    database = empty_and_return_database
    property_list = PropertyList.new(database)

    rainbow = property_list.add(Property.new(
      "Rainbow Lodge",
      "6 Rue du Gue, Rueil-Malmaison, France",
      60,
      "Suburban property"
    ))
    sunshine = property_list.add(Property.new(
      "Sunshine Cottage",
      "72 Stewart Place, Ware, England",
      50,
      "Beachfront property"
    ))
    
    property_list.update(sunshine,
      "Sunshine Cottage",
      "7 The Promenade, Porthmadog, Wales",
      50,
      "Beachfront property"
    )

    properties = property_list.list
    expect(properties[0].address).to eq "6 Rue du Gue, Rueil-Malmaison, France"
    expect(properties[1].address).to eq "7 The Promenade, Porthmadog, Wales"
  end

  it "gets a single property" do
    database = empty_and_return_database
    property_list = PropertyList.new(database)

    rainbow = property_list.add(Property.new(
      "Rainbow Lodge",
      "6 Rue du Gue, Rueil-Malmaison, France",
      60,
      "Suburban property"
    ))
    sunshine = property_list.add(Property.new(
      "Sunshine Cottage",
      "7 The Promenade, Porthmadog, Wales",
      50,
      "Beachfront property"
    ))
    honeysuckle = property_list.add(Property.new(
      "Honeysuckle Bungalow",
      "72 Stewart Place, Ware, England",
      90,
      "Brilliant views"
    ))

    property = property_list.get(honeysuckle)
    expect(property.name).to eq "Honeysuckle Bungalow"
  end
end
