require "rails_helper"

RSpec.describe Flight, type: :model do
  it "has a valid factory" do
    expect(build(:flight)).to be_valid
  end

  let(:flight) { build(:flight) }

  context "respond to instance method calls" do
    it { expect(flight).to respond_to(:economy) }
    it { expect(flight).to respond_to(:first) }
    it { expect(flight).to respond_to(:airline) }
  end
end
