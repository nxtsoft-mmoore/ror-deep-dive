Rails.application.routes.draw do

  root 'places#index'

  resources :places

  get 'api/places_list', to: 'places#api_list'
  post 'api/distance', to: 'places#api_distance'

end
