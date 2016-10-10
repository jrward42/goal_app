require 'rails_helper'

feature 'the signup process' do

  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content('Sign up')
  end

  feature 'signing up a user' do
    before(:each) do
      visit new_user_url
      fill_in 'Username', with: 'user'
      fill_in 'Password', with: 'password'
      click_on 'Sign up'
    end

    scenario 'redirects to user page after sign up' do
      expect(page).to have_content 'user\'s Profile Page'
    end
  end
end

feature 'the sign in process' do
  scenario 'has a sign in page' do
    visit new_session_url
    expect(page).to have_content 'Sign In'
  end

  feature 'signing in' do
    before(:each) do
      User.create(username: 'test', password: '123456')
      visit new_session_url
      fill_in 'Username', with: 'test'
      fill_in 'Password', with: '123456'
      click_on 'Sign in'
    end

    scenario 'redirects to user page after sign in' do
      expect(page).to have_content 'test\'s Profile Page'
      expect(page.has_link?('All Users', href: users_url))
    end
  end
end

feature 'the sign out process' do
  before(:each) do
    User.create(username: 'test', password: '123456')
    visit new_session_url
    fill_in 'Username', with: 'test'
    fill_in 'Password', with: '123456'
    click_on 'Sign in'
  end

  scenario 'returns to login when user clicks link to sign out' do
    visit users_url
    click_on 'Log out'
    expect(page).to have_content('Sign In')
  end
end
