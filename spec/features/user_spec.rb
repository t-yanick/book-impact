require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  before :each do
    @user1 = User.create(name: 'ngwa', username: '@ngwa', email: 'ngwa@test.com', password: '123456', id: 1)
    @user2 = User.create(name: 'tebong', username: '@tebong', email: 'tebong@test.com', password: '123456', id: 2)
    @user3 = User.create(name: 'teke', username: '@teke', email: 'teke@test.com', password: '123456', id: 3)
    Following.create(id: 1, follower_id: 1, followed_id: 3)
  end

  feature 'User can' do
    scenario 'user can login and logout' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'ngwa@test.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully.')
      click_on 'Logout'
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end

  feature 'User can' do
    scenario 'user can follow' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'ngwa@test.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit '/users/3'
      expect(page).to have_content('teke')
    end
  end
end
