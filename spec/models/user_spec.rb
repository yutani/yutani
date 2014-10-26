require "rails_helper"

RSpec.describe User, :type => :model do
  describe "validation" do
    it "is valid with valid attributes" do
      expect(build(:user)).to be_valid
    end
  end

  describe "#email" do
    it "must be unique" do
      user = create(:user)

      expect(build(:user, :email => user.email)).not_to be_valid
      expect(build(:user, :email => user.email.upcase)).not_to be_valid
    end

    it "must be a valid email address" do
      expect(build(:user, :email => "not_valid")).not_to be_valid
    end
  end

  describe "#password" do
    it "must be at least 6 characters" do
      password = "aaaaa"
      user = build(:user, :password => password,
                          :password_confirmation => password)

      expect(user).not_to be_valid
    end
  end

  describe "#first_name" do
    it "cannot be blank" do
      expect(build(:user, :first_name => nil)).not_to be_valid
    end

    it "must not be greater than 50 characters" do
      expect(build(:user, :first_name => "a" * 51)).not_to be_valid
    end
  end

  describe "#last_name" do
    it "cannot be blank" do
      expect(build(:user, :last_name => nil)).not_to be_valid
    end

    it "must not be greater than 50 characters" do
      expect(build(:user, :last_name => "a" * 51)).not_to be_valid
    end
  end
end

