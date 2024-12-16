module GameSessions
  AVAILABLE_FIGURES = [0, 1].freeze
  CIRCLE_VALUE = 0.freeze
  CROSS_VALUE = 1.freeze

  def self.table_name_prefix
    "game_sessions_"
  end
end
