require "helpers/database_helpers"

RSpec.describe "Properties Feature (Example)", type: :feature do
  before(:each) do
    DatabaseHelpers.clear_table("properties")
    DatabaseHelpers.clear_table("users")
  end

  context 'Sign up/login and sign out' do
    it "signs up a user and shows profile page" do
      visit "/users/new"
      # save_and_open_page
      fill_in "username", with: "DemisBrown"
      fill_in "first_name", with: "Demis"
      fill_in "last_name", with: "Brown"
      fill_in "email", with: "demis@gmail.com"
      fill_in "number", with: "07666666666"
      fill_in "password", with: "1234"
      click_button "Signup"

      expect(page).to have_content "DemisBrown"
    end

    it "logs in and logs out showing the correct menu" do
      visit "/users/new"
      fill_in "username", with: "DemisBrown"
      fill_in "first_name", with: "Demis"
      fill_in "last_name", with: "Brown"
      fill_in "email", with: "demis@gmail.com"
      fill_in "number", with: "07666666666"
      fill_in "password", with: "1234"
      click_button "Signup"
      click_link "Log Out"
      expect(page).to have_content "Log In"
      click_link "Log In"
      fill_in "email", with: "demis@gmail.com"
      fill_in "password", with: "1234"
      click_button "Log In"

      expect(page).to have_content "DemisBrown"
      expect(page).to have_content "Demis"
      expect(page).to have_content "Brown"
      expect(page).to have_content "Add Property"
      click_link "Log Out"
      
      expect(page).not_to have_content "Add Property"
      expect(page).to have_content "Log In"
    end
    
  end
end
