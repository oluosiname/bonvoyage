require "rails_helper"

RSpec.describe "Signup", type: :feature do
  before(:all) do
    User.destroy_all
  end

  context "Signup" do
    context "While on sign in page" do
      scenario "page has content 'Sign Up' " do
        visit login_path
        within(:css, "div.signup-down") do
          click_link "Sign Up"
        end
        expect(page).to have_current_path(new_user_path)
        expect(page).to have_content("Sign Up")
      end
    end
  end

  context "sign up" do
    scenario "new user sign up" do
      visit new_user_path
      fill_in "Username", with: "Kpeace"
      fill_in "Email", with: "example@example.com"
      fill_in "Password", with: "password"
      fill_in "user[confirmpassword]", with: "password"
      click_button "Sign Up"
      expect(page).to have_content "Welcome Kpeace"
    end
  end
end
