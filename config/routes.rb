Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do 
    resources :users, only: [:create]
    post '/sign_up', to: 'users#create', as: :sign_up
  end
end
