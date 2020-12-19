# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Test to verify if the users opinions' do
  before :each do
    @user1 = User.create(name: 'ngwa', username: '@ngwa', email: 'ngwa@test.com', password: '123456', id: 1)
    @user2 = User.create(name: 'tebong', username: '@tebong', email: 'tebong@test.com', password: '123456', id: 2)
    @user3 = User.create(name: 'teke', username: '@teke', email: 'teke@test.com', password: '123456', id: 3)
    Opinion.create(user_id: 1, body: 'Ngwa Opinion')
    Opinion.create(user_id: 2, body: 'Tebong Opinion')
    Opinion.create(user_id: 3, body: 'Teke Opinion')
  end
  feature 'User can see other users opinions' do
    scenario 'sign in and go to opinion index' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'ngwa@test.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_content('Tebong Opinion')
      expect(page).to have_content('Teke Opinion')
    end
  end

  feature 'User can create opinion' do
    scenario 'sign in and go to opinion index' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'ngwa@test.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit '/users/1'
      expect(page).to have_content('Ngwa Opinion')
    end
  end
end
