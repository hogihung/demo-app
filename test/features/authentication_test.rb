require_relative "../test_helper"

feature 'User Authentication' do
  let(:user) { build(:user) }
  let(:account) { create(:account, owner: user) }

  scenario 'receives error when using invalid credentials' do
    sign_user_in(user, subdomain: account.subdomain, password: 'bogus_password')
    page.must_have_content('Invalid Email or password')
  end

  scenario 'can successfully log in with valid credentials' do
    sign_user_in(user, subdomain: account.subdomain)
    page.must_have_content('Signed in successfully')
  end

  scenario 'does not allow user to sign in unless on subdomain' do
    visit new_user_session_path
    page.must_have_content("The page you were looking for doesn't exist.")
  end

  scenario 'does not allow user from one subdomain to sign in to another subdomain' do
    # ****** NOT WORKING YET ******
    # To fix this we need a solution like the Apartment Gem - COMING SOON
    # ****** --------------- ******
    user2 = build(:user)
    account2 = create(:account, owner: user2)

    sign_user_in(user2, subdomain: account2.subdomain)
    page.must_have_content('Signed in successfully')

    sign_user_in(user2, subdomain: account.subdomain)
    page.must_have_content('Invalid Email or password')
  end

  scenario 'user can sign out' do
    sign_user_in(user, subdomain: account.subdomain)

    click_link 'Sign out'

    page.must_have_content('Signed out successfully')
  end

  def sign_user_in(user, opts={})
    visit new_user_session_url(subdomain: opts[:subdomain])
    fill_in 'Email', with: user.email
    fill_in 'Password', with: (opts[:password] || user.password)
    click_button 'Sign in'
  end
end
