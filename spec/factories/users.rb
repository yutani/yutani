FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "person#{n}@example.com"}
    first_name		"Luke"
    second_name		"Bennellick"
    password    	"Secret123"
    password_confirmation "Secret123"
  end
end