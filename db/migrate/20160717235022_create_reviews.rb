class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :player_id
      t.integer :goal_id
      t.integer :interest
      t.integer :clarity
      t.integer :difficulty_anticipated
      t.integer :difficulty_hindsight
      t.integer :relevance
      t.text :comments_before
      t.text :comments_after

      t.timestamps
    end
  end
end
