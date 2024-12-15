class GameSessions::Move < ApplicationRecord
  belongs_to :session, foreign_key: :game_sessions_session_id
  belongs_to :player, foreign_key: :game_sessions_player_id
  belongs_to :field, foreign_key: :game_sessions_field_id
end
