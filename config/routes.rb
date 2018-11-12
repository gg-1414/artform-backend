Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :bidders, only: [:index, :show, :create, :update, :destroy]
      resources :artists, only: [:index, :show, :create, :update, :destroy]
      resources :arts, only: [:index, :show, :create, :update, :destroy]
      resources :biddings, only: [:index, :create, :update, :destroy]
      resources :tags, only: [:index, :create, :destroy]
      resources :art_tags, only: [:index, :create, :destroy]

      get '/arts/search/:tag', to: 'tags#search', as: 'search_art'
      post '/artists_auth', to: 'artists_auth#create'
      get '/current_artist', to: 'artists_auth#show'
      post '/bidders_auth', to: 'bidders_auth#create'
      get '/current_bidder', to: 'bidders_auth#show'
      get '/arts/winner/:id', to: 'arts#winner'
    end
  end
end
