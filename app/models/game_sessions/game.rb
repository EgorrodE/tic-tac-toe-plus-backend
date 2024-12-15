class GameSessions::Game < ApplicationRecord
  belongs_to :session_row, required: false, foreign_key: :game_sessions_session_row_id, class_name: 'GameSessions::SessionRow'
  has_many :game_rows, foreign_key: :game_sessions_game_id, class_name: 'GameSessions::GameRow'
  has_many :fields, through: :game_rows

  validates :game_rows, length: { minimum: 3, maximum: 3 }
end
