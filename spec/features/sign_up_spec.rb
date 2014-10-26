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

    it "notifies user of success" do
      fill_in "First name",    :with => "Luke Bennellick"
      fill_in "Last name",     :with => "Bennellick"
      fill_in "Email",         :with => "example@test.com"
      fill_in "Password",      :with => "Secret123"
      fill_in "Password confirmation", :with => "Secret123"
      click_on("Create Account")

      expect(page).to have_content(/account created/i)
    end
  end

  context "with invalid credentials" do
    it "disallows creating a user" do
      fill_in "First name", :with => ""
      fill_in "Last name",  :with => ""
      fill_in "Email",      :with => ""
      fill_in "Password",   :with => ""
      fill_in "Password confirmation", :with => ""

      expect { click_on "Create Account" }.to_not change(User, :count)
      expect(page).to have_content(/can't be blank/i)
    end
  end
end
