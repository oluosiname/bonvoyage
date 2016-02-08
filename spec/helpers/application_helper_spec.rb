require "rails_helper"
RSpec.describe ApplicationHelper, type: :helper do
  describe "#logged_in?" do
    it "returns false when a user is not logged in" do
      expect(logged_in?).to eq false
    end
  end
end
