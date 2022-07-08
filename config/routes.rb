Rails.application.routes.draw do
  resources :reservations
  resources :tours
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }

  resources :tours, only: %i[index create update show destroy]
  resources :reservations, only: %i[create show destroy]
end
