require "rails_helper"

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(create(:user)).to be_valid
  end

  it "has invalid factory" do
    expect(build(:user, email: nil)).to be_invalid
  end

  let(:user) { create(:user) }

  context "respond to instance method calls" do
    it { expect(user).to respond_to(:username) }
    it { expect(user).to respond_to(:email) }
    it { expect(user).to respond_to(:password_digest) }
    it { expect(user.username).to eq(user.username.capitalize) }
    it { expect(user.email).to eq(user.email.downcase) }
  end

  describe "ActiveModel Validation" do
    it { expect(user).to allow_value("kolawole").for(:username) }
    it { expect(user).to allow_value("sname@andela.com").for(:email) }
  end
end
