Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  scope module: "game_sessions" do
    resource :sessions, only: %i[] do
      post :join, to: 'sessions#join'
      post :create, to: 'sessions#create'
    end
  end
end
