class CreateGameSessionsPlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :game_sessions_players do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.belongs_to :game_sessions_session

      t.integer :figure, null: false, default: 0

      t.timestamps
    end
  end
end
