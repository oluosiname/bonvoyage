require "rails_helper"

RSpec.describe UsersController do
  it "renders the right view when user clicks on sign up" do
    get :new
    expect(response).to render_template "new"
  end
end
