# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(username: 'user', password: 'password')
  end

  describe "validations" do
    it { should validate_presence_of(:username)}
    it { should validate_presence_of(:password_digest)}
    it { should validate_presence_of(:session_token)}
    it { should validate_uniqueness_of(:username)}
  end

  describe 'ensure_session_token' do
    it 'generate session_token' do
      expect(@user.session_token).not_to be nil
    end
  end

  describe 'User.find_by_credentials' do
    it "finds users by credentials" do
      expect(User.find_by_credentials('user', 'password')).to eq(@user)
    end
  end

  describe 'reset_session_token' do
    it "changes session token" do
      old_token = @user.session_token
      @user.reset_session_token!
      expect(@user.session_token).not_to eq(old_token)
    end
  end
end
