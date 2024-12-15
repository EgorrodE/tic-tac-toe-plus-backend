class GameSessions::GameRow < ApplicationRecord
  belongs_to :game, required: false, foreign_key: :game_sessions_game_id, class_name: 'GameSessions::Game'
  has_many :fields, foreign_key: :game_sessions_game_row_id, class_name: 'GameSessions::Field'

  validates :fields, length: { minimum: 3, maximum: 3 }
end
