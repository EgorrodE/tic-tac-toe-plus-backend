module GameSessions
  class SessionRowBuilder < BaseBuilder
    def call
      result = SessionRow.new(params)
      result.games = ((0..2)).map {|i| GameBuilder.call(position: i)}
      result
    end
  end
end