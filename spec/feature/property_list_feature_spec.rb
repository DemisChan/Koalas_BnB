require "helpers/database_helpers"

RSpec.describe "Properties Feature (Example)", type: :feature do
  before(:each) do
    DatabaseHelpers.clear_table("properties")
  end

  it "starts with an empty list of properties" do
    visit "/properties"
    expect(page).to have_content "There is no properties in your area"
  end

  xit "add an entry" do
    visit "/properties"
    click link "Add property"
    fill_in "Villa Rainbow" , with: "Name" 
    fill_in "Paphos, Cyprus", with: "Address" 
    fill_in "Beautiful house on the beach", with: "Description" 
    fill_in "£80", with: "Price" 
    click_button "Post"

    expect(page). to have_content "Villa Rainbow"
    expect(page). to have_content "Paphos, Cyprus"
    expect(page). to have_content "Beautiful house on the beach"
    expect(page). to have_content "£80"
  end

  xit "adds multiple entries" do
    visit "/properties"
    click link "Add property"
    fill_in "Villa Rainbow", with: "Name"
    fill_in "Paphos, Cyprus", with: "Address"
    fill_in "Beautiful house on the beach", with: "Description"
    fill_in "£80", with: "Price"
    click button "Post"

    click link "Add property"
    fill_in "Villa Rainbow 2", with: "Name"
    fill_in "Limassol, Cyprus", with: "Address"
    fill_in "Beautiful house in the woods", with: "Description"
    fill_in "£90", with: "Price"
    click button "Post"
    
    expect(page). to have_content "Villa Rainbow"
    expect(page). to have_content "Paphos, Cyprus"
    expect(page). to have_content "Beautiful house on the beach"
    expect(page). to have_content "£80"
    expect(page). to have_content "Villa Rainbow 2"
    expect(page). to have_content "Beautiful house in the woods"
    expect(page). to have_content "£90"
  end
end
