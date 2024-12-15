class CreateGameSessionsGameRows < ActiveRecord::Migration[7.0]
  def change
    create_table :game_sessions_game_rows do |t|
      t.belongs_to :game_sessions_game

      t.integer :position, null: false

      t.timestamps
    end
  end
end
