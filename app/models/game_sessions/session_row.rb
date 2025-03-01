class GameSessions::SessionRow < ApplicationRecord
  belongs_to :session, required: false, foreign_key: :game_sessions_session_id, class_name: 'GameSessions::Session'
  has_many :games,
           -> { order(:position) },
           foreign_key: :game_sessions_session_row_id,
           dependent: :destroy
  has_many :game_rows, through: :games
  has_many :fields, through: :game_rows

  validates :games, length: { minimum: 3, maximum: 3 }
end
