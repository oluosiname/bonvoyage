describe "the signin process", :type => :feature do

  before(:all) do
    User.destroy_all
  end
  before :each do
    @user = create(:user)
  end

  it "signs me in" do
    visit login_path
    within(".signup-container") do
      fill_in "Email", with: @user.email
      fill_in "Password", with: @user.password
    end
    click_button "Sign In"
    expect(page).to have_content "Welcome"
  end
end
