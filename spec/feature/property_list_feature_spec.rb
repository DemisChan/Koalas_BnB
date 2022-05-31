require "helpers/database_helpers"

RSpec.describe "properties list Feature (Example)", type: :feature do
  before(:each) do
    DatabaseHelpers.clear_table("properties")
  end

  it "starts with an empty list of properties" do
    visit "/properties"
    expect(page).to have_content "There are no properties."
  end

end
