Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate'
  resources :user, :farm

  get 'farms/search_nearby(/:distance)', to: 'farms#search_nearby'
end
