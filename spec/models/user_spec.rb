require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(id: 1) }

  describe 'associations' do
    it { should have_many(:opinions) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should have_many(:followers).class_name('Following') }
    it { should have_many(:followeds).class_name('Following') }
  end

  describe 'validations' do
    subject { User.create(name: 'tazoh yanick', username: 'yanick', email: 'ynick@test.com', password: '123456', id: 1) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:username) }
  end
end
