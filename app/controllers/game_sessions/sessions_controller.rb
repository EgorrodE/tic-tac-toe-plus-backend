module GameSessions
  class SessionsController < ApplicationController
    respond_to :json

    def create
      return unless validate_user

      session = SessionBuilder.call(user_id: current_user.id)
      render(json: { secret: session.secret }) and return if session.save

      render plain: 'Something went wrong. Try again.', status: :unprocessable_entity
    end

    def join
      return unless validate_user

      session = Session.find_by(secret: params[:secret])
      return unless validate_session_exists(session)

      render(json: session_data(session)) and return if user_player(session).present?

      if session.players.count > 1
        render plain: 'Game already full', status: :unprocessable_entity
        return
      end

      opponent = session.players.last
      player = Player.new(player_params(session, opponent))
      render(json: session_data(session.reload)) and return if player.save

      render plain: 'Something went wrong. Try again.', status: :unprocessable_entity
    end

    def move
      return unless validate_user

      session = Session.find_by(secret: params[:secret])
      return unless validate_session_exists(session)

      player = user_player(session)
      render(plain: 'You are not participating in the game', status: :unauthorized) and return if player.blank?

      new_move(session, player)
    end

    private

    def validate_user
      render(plain: 'login-required', status: :unauthorized) and return false unless current_user.present?

      true
    end

    def validate_session_exists(session)
      render(plain: 'Session not found', status: :not_found) and return unless session.present?
    end

    def user_player(session)
      session.players.find_by(user_id: current_user.id)
    end

    def new_move(session, player)

    end

    def session_data(session)
      { session: SessionSerializer.new(session).serializable_hash }
    end

    def player_params(session, opponent)
      {
        user: current_user,
        session: session,
        figure:  AVAILABLE_FIGURES.without(opponent.figure).first
      }
    end
  end
end
