class GameSessions::Player < ApplicationRecord
  belongs_to :user
  belongs_to :session,
             required: false,
             foreign_key: :game_sessions_session_id

  has_many :moves, foreign_key: :game_sessions_player_id, dependent: :nullify
end
