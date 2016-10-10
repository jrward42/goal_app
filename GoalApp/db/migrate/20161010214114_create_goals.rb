class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.text :details
      t.string :visibility, null: false
      t.string :finished, null: false, default: "ongoing"
      t.timestamps null: false
    end
  end
end
