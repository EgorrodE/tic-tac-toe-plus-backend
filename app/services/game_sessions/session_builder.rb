module GameSessions
  class SessionBuilder < BaseBuilder
    def call
      result = Session.new(params)
      result.players = [Player.new(params.slice(:user_id), figure: [1,2].sample)]
      result.secret = SecureRandom.base64
      result.session_rows = ((0..2)).map {|i| SessionRowBuilder.call(position: i)}
      result
    end
  end
end