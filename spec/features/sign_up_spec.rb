require "rails_helper"

RSpec.describe "Signing up" do
  before { visit new_user_path }

  context "with valid credentials" do
    it "creates a new user" do
      fill_in "First name",    :with => "Luke Bennellick"
      fill_in "Last name",     :with => "Bennellick"
      fill_in "Email",         :with => "example@test.com"
      fill_in "Password",      :with => "Secret123"
      fill_in "Password confirmation", :with => "Secret123"

      expect { click_on "Create Account" }.to change(User, :count).by(1)
    end
  end
end
