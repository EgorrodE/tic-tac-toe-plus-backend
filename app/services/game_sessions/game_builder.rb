module GameSessions
  class GameBuilder < BaseBuilder
    def call
      result = Game.new(params)
      result.game_rows = ((0..2)).map {|i| GameRowBuilder.call(position: i)}
      result
    end
  end
end