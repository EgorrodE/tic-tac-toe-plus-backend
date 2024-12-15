class GameSessions::Player < ApplicationRecord
  belongs_to :user
  belongs_to :session, required: false, foreign_key: :game_sessions_session_id, class_name: 'GameSessions::Session'
  has_many :moves, foreign_key: :game_sessions_player_id, class_name: 'GameSessions::Move'
end
