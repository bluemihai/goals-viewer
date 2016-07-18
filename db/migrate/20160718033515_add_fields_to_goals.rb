class AddFieldsToGoals < ActiveRecord::Migration[5.0]
  def change
    add_column :goals, :tried, :integer, default: 0
    add_column :goals, :up, :integer, default: 0
    add_column :goals, :down, :integer, default: 0
  end
end
