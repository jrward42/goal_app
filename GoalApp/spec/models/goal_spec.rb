# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  details    :text
#  visibility :string           not null
#  finished   :string           default("ongoing"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          default(-1), not null
#

require 'rails_helper'

RSpec.describe Goal, type: :model do
  describe 'it can create a goal' do
    context 'with valid params' do
      it 'creates a goal' do
        goal = FactoryGirl.build(:goal, user_id: 1)
        expect(goal.save).to be true
      end
    end

    context 'with invalid params' do
      it 'doesnt create a goal' do
        goal = FactoryGirl.build(:goal, user_id: nil)
        expect(goal.save).to be false
      end
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:title)}
    it { should validate_presence_of(:visibility)}
    it { should validate_presence_of(:finished)}
    it { should validate_presence_of(:user_id)}
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
end
