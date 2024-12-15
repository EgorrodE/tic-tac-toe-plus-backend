class GameSessions::Field < ApplicationRecord
  belongs_to :game_row,
             required: false,
             foreign_key: :game_sessions_game_row_id

  has_one :game, through: :game_row
  has_one :session_row, through: :game
  has_one :session, through: :session_row
end
