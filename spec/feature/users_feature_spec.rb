# require "helpers/database_helpers"
# 
# RSpec.describe "Properties Feature (Example)", type: :feature do
#   before(:each) do
#     DatabaseHelpers.clear_table("properties")
#     DatabaseHelpers.clear_table("users")
#   end
# 
#   context 'Sign up/login and sign out' do
#     xit "signs up a user and shows profile page" do
#       visit "/registrations/new"
#       # save_and_open_page
#       fill_in "username", with: "Demis"
#       fill_in "password", with: "1234"
#       click_button "Signup"
#       expect(page).to have_content "Profile"
#       expect(page).to have_content "Demis"
#     end
#     
#   end
# end
# 