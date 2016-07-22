FactoryGirl.define do
  factory :account do
    sequence(:subdomain) { |sd| "subdomain#{sd}" }
    association :owner, factory: :user
  end
end
