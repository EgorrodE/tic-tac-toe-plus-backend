class GameSessions::SessionsController < ApplicationController
  respond_to :json

  def create
    render json: {}, status: :unauthorised and return unless current_user.present?

    session = SessionBuilder.call(user_id: current_user.id)
    render json: session_json(session) and return if session.save

    render json: {}, status: :unprocessable_entity
  end

  def join
    render json: {}, status: :unauthorised and return unless current_user.present?

    session = Session.find_by(secret: params[:secret])
    render json: {}, status: :not_found and return unless session.present?

    render json: session_json(session) and return if session.players.any?(user_id: current_user.id)
    if session.players.count > 1
      render json: { message: 'Game already full' }, status: :unprocessable_entity and return
    end

    opponent = session.players.last
    player = Player.new(player_params(session, opponent))
    render json: session_json(session.reload) and return if player.save

    render json: {}, status: :unprocessable_entity
  end

  private

  def session_json(session)
    SessionSerializer.new(session).serializable_hash.to_json
  end

  def player_params(session, opponent)
    {
      user: current_user,
      session: session,
      figure:  GameSessions::AVAILABLE_FIGURES.without(opponent.figure).first
    }
  end
end
