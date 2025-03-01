class GameSessions::Session < ApplicationRecord
  belongs_to :user
  has_many :players,
           foreign_key: :game_sessions_session_id,
           dependent: :destroy
  has_many :moves,
           -> { order(:position) },
           foreign_key: :game_sessions_session_id,
           dependent: :destroy
  has_many :session_rows,
           -> { order(:position) },
           foreign_key: :game_sessions_session_id,
           dependent: :destroy
  has_many :games, through: :session_rows
  has_many :game_rows, through: :games
  has_many :fields, through: :game_rows

  validates :players, length: { minimum: 1, maximum: 2 }
end
