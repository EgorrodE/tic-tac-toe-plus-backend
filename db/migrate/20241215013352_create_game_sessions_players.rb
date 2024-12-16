class CreateGameSessionsPlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :game_sessions_players do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.belongs_to :game_sessions_session

      t.integer :figure, null: false

      t.timestamps

      t.index [:game_sessions_session_id, :user_id], unique: true, name: :game_sessions_session_unique_players
    end
  end
end
