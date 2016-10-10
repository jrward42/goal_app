require 'rails_helper'

feature 'the goal creation process' do
  before(:each) do
    visit new_user_url
    fill_in 'Username', with: 'user'
    fill_in 'Password', with: 'password'
    click_on 'Sign up'
  end

  scenario 'the user creates a goal' do
    visit new_goal_url
    expect(page).to have_content('New goal')
  end

  scenario 'user creates valid goal' do
    visit new_goal_url
    fill_in 'Title', with: 'afdadf'
    fill_in 'Details', with: 'details'
    page.check 'Public?'
    page.check 'Completed?'
    click_on 'Create goal'
    expect(page).to have_content('Title:')
  end

  scenario 'user creates invalid goal' do
    visit new_goal_url
    fill_in 'Details', with: 'details'
    page.check 'Public?'
    page.check 'Completed?'
    click_on 'Create goal'
    expect(page).to have_content('New goal')
  end
end

feature 'the goal editing process' do
  before(:each) do
    visit new_user_url
    fill_in 'Username', with: 'user'
    fill_in 'Password', with: 'password'
    click_on 'Sign up'
    visit new_goal_url
    fill_in 'Title', with: 'afdadf'
    fill_in 'Details', with: 'details'
    page.check 'Public?'
    page.check 'Completed?'
    click_on 'Create goal'
  end

  scenario 'user edits goal' do
    visit edit_goal_url(1)
    expect(page).to have_content('Edit goal')
  end

  scenario 'fields are prefilled' do
    visit edit_goal_url(1)
    expect(find_field("Title").value).to eq "afdadf"
    expect(find_field("Details").value).to eq "details"


  end

  scenario 'user saves edits' do
    visit edit_goal_url(1)
    fill_in 'Title', with: 'NEW Title'
    click_on 'Edit goal'
    expect(page).to have_content('NEW')
  end
end

feature "goal deletion process" do
  before(:each) do
    visit new_user_url
    fill_in 'Username', with: 'user'
    fill_in 'Password', with: 'password'
    click_on 'Sign up'
    visit new_goal_url
    fill_in 'Title', with: 'afdadf'
    fill_in 'Details', with: 'details'
    page.check 'Public?'
    page.check 'Completed?'
    click_on 'Create goal'
  end

  scenario "user has option to delete goals" do
    visit user_url(1)
  end

end
