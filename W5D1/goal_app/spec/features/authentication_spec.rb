require 'rails_helper'
require 'spec_helper'


feature 'the signup process' do

  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content('New User')
  end

  feature 'signing up a user' do
    FactoryBot.build(:user, username: 'Lu')

    scenario 'shows username on the homepage after signup' do
      visit new_user_url
      fill_in 'Username', with: 'Lu'
      fill_in 'Password', with: 'password'
      click_on 'Sign Up'
      expect(page).to have_content("Lu")
    end

  end
end

feature 'logging in' do
  FactoryBot.create(:user, username: 'Lu')
  before(:each) do
    visit new_session_url
    fill_in 'Username', with: 'Lu'
    fill_in 'Password', with: 'password'
    click_on 'Log In'
  end
  scenario 'shows username on the homepage after login' do
    expect(page).to have_content("Lu")
  end

end

feature 'logging out' do
  before(:each) do
    visit new_session_url
    fill_in 'Username', with: 'Lu'
    fill_in 'Password', with: 'password'
    click_on 'Log In'
    click_on 'Log Out'
  end
  scenario 'begins with a logged out state' do
    expect(page).to have_current_path(new_session_url)
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    expect(page).not_to have_content('Lu')
  end

end
