class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :tables do |t|
      t.integer :rank
      t.string :team_name
      t.integer :match_count
      t.integer :point
      t.integer :win_count
      t.integer :draw_count
      t.integer :lose_count
      t.integer :score_count
      t.integer :lost_count

      t.timestamps
    end
  end
end
