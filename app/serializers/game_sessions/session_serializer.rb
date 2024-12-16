class GameSessions::SessionSerializer
  include JSONAPI::Serializer
  attributes :id, :secret, :status

  attribute(:gamesValues) do |session|
    session_rows = session.session_rows.includes(games: { game_rows: :fields })

    session_rows.map do |session_row|
      session_row.games.map do |game|
        {
          globalValue: game.value,
          values: game.game_rows.map do |game_row|
            game_row.fields.map(&:value)
          end
        }
      end
    end
  end

  attribute(:lastMove) do |session|
    move = session.moves.last
    next if move.blank?

    field = move.field
    path = [
      field.session_row.position,
      field.game.position,
      'values',
      field.game_row.position,
      field.position
    ]

    { path: path, value: move.value }
  end

  attribute(:players) do |session|
    session.players.map do |p|
      {
        id: p.user_id,
        figure: p.figure
      }
    end
  end
end
