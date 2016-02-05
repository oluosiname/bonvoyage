require "rails_helper"

RSpec.describe "Views", type: :feature do
  describe "Visit home page", type: :feature do
    it "Visits home page" do
      visit root_path
      expect(page).to have_content ("Search For Flights")
    end
  end

  describe "Visit sign in", type: :feature do
    it "Visits login page" do
      visit  login_path
      expect(page).to have_content "Sign In"
    end
  end

  describe "Visit sign in", type: :feature do
    it "Visits sign up page" do
      visit  new_user_path
      expect(page).to have_content "Sign Up"
    end
  end
end
