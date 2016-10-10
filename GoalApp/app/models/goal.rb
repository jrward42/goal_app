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

class Goal < ActiveRecord::Base
  validates :title, :visibility, :finished, :user_id, presence: true

  belongs_to :user


end
