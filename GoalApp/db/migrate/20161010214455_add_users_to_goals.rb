class AddUsersToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :user_id, :integer, null: false, default: 1
  end
end
