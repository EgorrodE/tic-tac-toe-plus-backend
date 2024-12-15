class GameSessions::Move < ApplicationRecord
  belongs_to :session, foreign_key: :game_sessions_session_id, class_name: 'GameSessions::Session'
  belongs_to :player, foreign_key: :game_sessions_player_id, class_name: 'GameSessions::Player'
  belongs_to :field, foreign_key: :game_sessions_field_id, class_name: 'GameSessions::Field'
end
