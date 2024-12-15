class GameSessions::Game < ApplicationRecord
  belongs_to :session_row,
             required: false,
             foreign_key: :game_sessions_session_row_id
  has_many :game_rows,
           -> { order(:position) },
           foreign_key: :game_sessions_game_id,
           dependent: :destroy
  has_many :fields, through: :game_rows

  validates :game_rows, length: { minimum: 3, maximum: 3 }
end
