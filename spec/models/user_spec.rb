require "rails_helper"

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  it "has invalid factory" do
    expect(build(:user, email: nil)).to be_invalid
  end

  let(:user) { build(:user) }

  context "respond to instance method calls" do
    it { expect(user).to respond_to(:username) }
    it { expect(user).to respond_to(:email) }
    it { expect(user).to respond_to(:password_digest) }
    it "formats username and email" do
      user = create(:user)
      expect(user.username).to eq(user.username.capitalize)
      expect(user.email).to eq(user.email.downcase)
      user.destroy
    end
  end

  describe "ActiveModel Validation" do
    it { expect(user).to allow_value("kolawole").for(:username) }
    it { expect(user).to allow_value("sname@andela.com").for(:email) }
  end
end
