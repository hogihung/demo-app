require_relative "../test_helper"

feature "Account" do
  scenario "Successfully creating an account and sign user in" do
    create_account

    fill_in 'Name', with: 'John'
    fill_in 'Email', with: 'hogihung@gmail.com'
    fill_in 'Password', with: 'pw'
    fill_in 'Password confirmation', with: 'pw'
    fill_in 'account_subdomain', with: 'Test-Subdomin'
    click_button 'Create Account'

    page.must_have_content 'Signed up successfully'
    page.must_have_content 'Sign out'
  end

  scenario "Confirm error message for missing name attribute" do
    create_account

    fill_in 'Name', with: ''
    fill_in 'Email', with: 'john@nurny.com'
    fill_in 'Password', with: 'pw'
    fill_in 'Password confirmation', with: 'pw'
    fill_in 'account_subdomain', with: 'Test-Subdomin'
    click_button 'Create Account'

    page.must_have_content "Name can't be blank"
  end

  scenario "Confirm error message for missing email attribute" do
    create_account

    fill_in 'Name', with: 'John'
    fill_in 'Email', with: ''
    fill_in 'Password', with: 'pw'
    fill_in 'Password confirmation', with: 'pw'
    fill_in 'account_subdomain', with: 'Test-Subdomin'
    click_button 'Create Account'

    page.must_have_content "Email can't be blank"
  end

  scenario "Confirm error message for missing password attribute" do
    create_account

    fill_in 'Name', with: 'John'
    fill_in 'Email', with: 'john@nurny.com'
    fill_in 'Password', with: ''
    fill_in 'Password confirmation', with: 'pw'
    fill_in 'account_subdomain', with: 'Test-Subdomin'
    click_button 'Create Account'

    page.must_have_content "Password can't be blank Password confirmation doesn't match Password "
  end

  scenario "Confirm error message for missing password confirmation attribute" do
    create_account

    fill_in 'Name', with: 'John'
    fill_in 'Email', with: 'john@nurny.com'
    fill_in 'Password', with: 'pw'
    fill_in 'Password confirmation', with: ''
    fill_in 'account_subdomain', with: 'Test-Subdomain'
    click_button 'Create Account'

    page.must_have_content "Password confirmation doesn't match Password"
  end

  scenario "Confirm error message for missing subdomain attribute" do
    create_account

    fill_in 'Name', with: 'John'
    fill_in 'Email', with: 'john@nurny.com'
    fill_in 'Password', with: 'pw'
    fill_in 'Password confirmation', with: 'pw'
    fill_in 'account_subdomain', with: ''
    click_button 'Create Account'

    page.must_have_content "Subdomain .demoapp.dev can't be blank"
  end

  def create_account
    visit root_path
    click_link 'Create Account'
  end
end
