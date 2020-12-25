require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UsersHelper, type: :helper do
  before :each do
    @user1 = User.create(name: 'ngwa', username: '@ngwa', email: 'ngwa@test.com', password: '123456', id: 1)
    @user2 = User.create(name: 'tebong', username: '@tebong', email: 'tebong@test.com', password: '123456', id: 2)
    @user3 = User.create(name: 'teke', username: '@teke', email: 'teke@test.com', password: '123456', id: 3)
  end
  describe "follow and unfollow" do
    it "displays follow link" do
      return links if @user1.followds.include?(@user2)
      'Unfollow' unless @user1.followds.include?(@user3) || @user1 == @user3
    end
  end
end
