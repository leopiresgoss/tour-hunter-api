Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
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

  get 'my_reservations', to: 'reservations#my_reservations'
end
