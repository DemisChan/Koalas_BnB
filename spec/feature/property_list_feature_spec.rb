require "helpers/database_helpers"

RSpec.describe "Properties Feature (Example)", type: :feature do
  before(:each) do
    DatabaseHelpers.clear_table("properties")
  end

  it "starts with an empty list of properties" do
    visit "/properties"
    expect(page).to have_content "There is no properties in your area"
  end

  it "add an entry" do
    visit "/properties"
    click_link "Add Property"
    fill_in "Name" , with: "Villa Rainbow " 
    fill_in "Address", with: "Paphos, Cyprus" 
    fill_in "Description", with: "Beautiful house on the beach" 
    fill_in "Price", with: 80 
    click_button "Add Property"

    expect(page).to have_content "Villa Rainbow"
    expect(page).to have_content "Paphos, Cyprus"
    expect(page).to have_content "Beautiful house on the beach"
    expect(page).to have_content 80
  end

  it "adds multiple entries" do
    visit "/properties"
    click_link "Add Property"
    fill_in "Name", with: "Villa Rainbow"
    fill_in "Address", with: "Paphos, Cyprus"
    fill_in "Description", with: "Beautiful house on the beach"
    fill_in "Price", with: 80
    click_button "Add Property"

    click_link "Add Property"
    fill_in "Name", with: "Villa Rainbow 2"
    fill_in "Address", with: "Limassol, Cyprus"
    fill_in "Description", with: "Beautiful house in the woods"
    fill_in "Price", with: 90
    click_button "Add Property"
    
    expect(page).to have_content "Villa Rainbow"
    expect(page).to have_content "Paphos, Cyprus"
    expect(page).to have_content "Beautiful house on the beach"
    expect(page).to have_content 80
    expect(page).to have_content "Villa Rainbow 2"
    expect(page).to have_content "Beautiful house in the woods"
    expect(page).to have_content 90
  end

  it "adds properties and removes one" do

    visit "/properties"
    click_link "Add Property"
    fill_in "Name", with: "Villa Rainbow"
    fill_in "Address", with: "Paphos, Cyprus"
    fill_in "Description", with: "Beautiful house on the beach"
    fill_in "Price", with: 80
    click_button "Add Property"

    click_link "Add Property"
    fill_in "Name", with: "Villa Rainbow 2"
    fill_in "Address", with: "Limassol, Cyprus"
    fill_in "Description", with: "Beautiful house in the woods"
    fill_in "Price", with: 90
    click_button "Add Property"

    click_link "Add Property"
    fill_in "Name", with: "Villa Rainbow 3"
    fill_in "Address", with: "London, england"
    fill_in "Description", with: "shite house in the sea"
    fill_in "Price", with: 120
    click_button "Add Property"

    click_button "delete_Villa Rainbow 2"
    
    expect(page).to have_content "Villa Rainbow"
    expect(page).to have_content "Paphos, Cyprus"
    expect(page).to have_content "Beautiful house on the beach"
    expect(page).to have_content 80
    expect(page).not_to have_content "Villa Rainbow 2"
    expect(page).not_to have_content "Limassol, Cyprus"
    expect(page).not_to have_content "Beautiful house in the woods"
    expect(page).not_to have_content 90
    expect(page).to have_content "Villa Rainbow 3"
    expect(page).to have_content "London, england"
    expect(page).to have_content "shite house in the sea"
    expect(page).to have_content 120


  end

end
