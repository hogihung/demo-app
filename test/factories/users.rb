FactoryGirl.define do
  factory :user do
    name "Johnny"
    sequence(:email) { |em| "juser#{em}@someemail.com" }
    password "pw"
  end
end
