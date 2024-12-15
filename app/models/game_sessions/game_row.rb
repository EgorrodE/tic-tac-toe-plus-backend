class GameSessions::GameRow < ApplicationRecord
  belongs_to :game,
             required: false,
             foreign_key: :game_sessions_game_id
  has_many :fields,
           -> { order(:position) },
           foreign_key: :game_sessions_game_row_id,
           dependent: :destroy

  validates :fields, length: { minimum: 3, maximum: 3 }
end
