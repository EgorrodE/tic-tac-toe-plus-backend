module GameSessions
  class SessionBuilder < BaseBuilder
    def call
      result = Session.new(params)
      result.players = [Player.new(user_id: params[:user_id], figure: AVAILABLE_FIGURES.sample)]
      result.secret = SecureRandom.hex
      result.session_rows = (0..2).map {|i| SessionRowBuilder.call(position: i)}
      result
    end
  end
end
