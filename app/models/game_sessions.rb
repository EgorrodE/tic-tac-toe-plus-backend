module GameSessions
  AVAILABLE_FIGURES = [1, 2].freeze

  def self.table_name_prefix
    "game_sessions_"
  end
end
