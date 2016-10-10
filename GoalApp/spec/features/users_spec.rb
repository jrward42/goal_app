require 'rails_helper'

feature "the users page" do
  scenario "has links to other users" do
    User.create(username: "test", password: "password")
    visit users_url
    expect(page.has_link?('test', href: user_url(User.first)))
  end

  scenario "links redirect to user page" do

    User.create(username: "test", password: "password")
    visit new_session_url
    fill_in 'Username', with: 'test'
    fill_in 'Password', with: 'password'
    click_on 'Sign in'
    visit users_url
    click_on "test"
    expect(page).to have_content("test's Profile Page")
  end

end
