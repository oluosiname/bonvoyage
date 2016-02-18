describe "the signin process", type: :feature do
  before(:all) do
    User.destroy_all
  end
  before :each do
    @user = create(:user)
  end

  context "Signin with valid credentials" do
    it "signs in valid user" do
      visit login_path
      fill_in "email", with: @user.email
      fill_in "password", with: @user.password
      click_button "Sign In"
      expect(page).to have_content "Welcome Adebayo"
    end
  end

  context "Trying to Sign in with invalid credentials " do
    it "doesnt sign in, raises error" do
      visit login_path
      fill_in "email", with: "sss@sss.com"
      fill_in "password", with: @user.password
      click_button "Sign In"

      expect(page).to have_current_path(login_path)
      expect(page).to have_content("Invalid email/password")
    end
  end

  context "Logout if user is signed out" do
    it "signs in valid user" do
      visit login_path
      within(:css, "div.signup-me") do
        fill_in "email", with: @user.email
        fill_in "password", with: @user.password
      end
      click_button "Sign In"
      within(".dropdown-menu") do
        click_link "Log Out"
      end
    end
  end
end
