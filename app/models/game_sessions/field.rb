class GameSessions::Field < ApplicationRecord
  belongs_to :game_row, required: false, foreign_key: :game_sessions_game_row_id, class_name: 'GameSessions::GameRow'
end
