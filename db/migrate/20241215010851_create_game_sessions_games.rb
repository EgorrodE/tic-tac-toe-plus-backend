class CreateGameSessionsGames < ActiveRecord::Migration[7.0]
  def change
    create_table :game_sessions_games do |t|
      t.belongs_to :game_sessions_session_row

      t.integer :position, null: false
      t.integer :value

      t.timestamps
    end
  end
end
