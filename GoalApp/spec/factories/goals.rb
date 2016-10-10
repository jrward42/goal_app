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

FactoryGirl.define do
  factory :goal do
    title 'Make a Goal'
    details 'I want to make a goal'
    visibility 'true'
    finished 'false'
  end
end
