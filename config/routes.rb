Rails.application.routes.draw do
  
  namespace :api do 
    namespace :v1 do
      resources :users , only: [:create]
      resources :users, only: [:show], param: :user_name
      resources :books, only: [:create, :destroy]
      resources :books, only: [:index, :show]
      resources :users, only: [:show] do
        resources :reservations, only: [:create, :index]

      end
    end
  end
end