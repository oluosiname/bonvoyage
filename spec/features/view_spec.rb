require "rails_helper"

RSpec.describe "Signup", type: :feature do
  describe "Visit home page", type: :feature do
    it "Visits home page" do
      visit root_path
      expect(page).to have_content ("Search For Flights")
    end
  end
end
