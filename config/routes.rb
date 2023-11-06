Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #  devise_for :users, controllers: {
  #       sessions: 'users/sessions'
  #     }

   devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },


  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }

  # resources :sessions, only: [:create]
  # resources :users

  # delete :logout, to: "users/sessions#logout"
  # get :logged_in, to: "users/sessions#logged_in"

  # root to: "static#home"
  namespace :api do
    namespace :v1 do
      resources :properties do
        resources :inspections
      end

      resources :users do
        resources :inspections
      end
    end
  end

end
