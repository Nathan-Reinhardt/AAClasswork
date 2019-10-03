require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit('/users/new')
    page.has_content?('Create User')
    find_button('submit').click
  end

  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup' do
      fill_in('Email', :with => 'logo@gmail.com')
      fill_in('Password', :with => 'password')
      find_button('submit').click
      page.has_content?('logo@gmail.com')
    end
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do
    visit('/sessions/new')
    fill_in('Email', :with => 'logo@gmail.com')
    fill_in('Password', :with => 'password')
    find_button('log in').click
    page.has_content?('logo@gmail.com')
  end

end

feature 'logging out' do
  scenario 'begins with a logged out state' do
    visit('/users/1')
    find_button('log out').click
    page.has_content?('logged out')
  end
  scenario 'doesn\'t show username on the homepage after logout' do
    visit('/users/1')
    find_button('log out').click
    page.should_not have_content?('logo@gmail.com')
  end
end