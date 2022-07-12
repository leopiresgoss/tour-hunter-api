Rails.application.routes.draw do
  resources :reservations
  resources :tours
  devise_for :users,
             defaults: { format: :json },
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }

  resources :tours, only: %i[index create update show destroy]
  resources :reservations, only: %i[index create show destroy]
end
