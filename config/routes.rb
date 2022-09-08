Rails.application.routes.draw do
  resources :missions, only: [:create, :index]
  resources :scientists
  resources :planets, only: :index
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
