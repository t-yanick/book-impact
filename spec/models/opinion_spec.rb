require 'rails_helper'

RSpec.describe Opinion, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  describe 'validations' do
    subject { Opinion.create(user_id: 1, body: 'tazoh yan') }

    it { should validate_presence_of(:body) }
  end
end
