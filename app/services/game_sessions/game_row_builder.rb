module GameSessions
  class GameRowBuilder < BaseBuilder
    def call
      result = GameRow.new(params)
      result.fields = ((0..2)).map {|i| Field.new(position: i)}
      result
    end
  end
end