require "property"

RSpec.describe Property do
  it "constructs without an ID" do
    property = Property.new(
      "Rainbow Lodge",
      "6 Rue du Gue, Rueil-Malmaison, France",
      60,
      "Beachfront property"
    )
    expect(property.name).to eq "Rainbow Lodge"
    expect(property.address).to eq "6 Rue du Gue, Rueil-Malmaison, France"
    expect(property.price).to eq 60
    expect(property.description).to eq "Beachfront property"
  end

  it "constructs with an ID" do
    property = Property.new(
      3
      "Rainbow Lodge",
      "6 Rue du Gue, Rueil-Malmaison, France",
      60,
      "Beachfront property",
    )
    expect(property.id).to eq 3
    expect(property.name).to eq "Rainbow Lodge"
    expect(property.address).to eq "6 Rue du Gue, Rueil-Malmaison, France"
    expect(property.price).to eq 60
    expect(property.description).to eq "Beachfront property"
  end
end
