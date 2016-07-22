require_relative "../test_helper"

class AccountTest < ActiveSupport::TestCase
  let(:owner) { FactoryGirl.create(:user) }

  should validate_presence_of(:owner)

  should validate_presence_of(:subdomain)
  should validate_uniqueness_of(:subdomain)

  it "should validate case insensitive uniqueness of" do
    create(:account, subdomain: 'Test')
    expect(build(:account, subdomain: 'test')).wont_be :valid?
  end

  should allow_value('musical').for(:subdomain)
  should allow_value('ms-vickies').for(:subdomain)
  should allow_value('MUSICCAL').for(:subdomain)

  should_not allow_value("www").for(:subdomain)
  should_not allow_value(".test").for(:subdomain)
  should_not allow_value("test/").for(:subdomain)
  should_not allow_value("email").for(:subdomain)
  should_not allow_value("mail").for(:subdomain)
  should_not allow_value("sms").for(:subdomain)

  it "should be valid with valid subdomain" do
    expect(FactoryGirl.build(:account, subdomain: 'test')).must_be :valid?
  end

  should belong_to(:owner)
end

