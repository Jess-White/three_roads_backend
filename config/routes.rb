Rails.application.routes.draw do
  namespace :api do
    get "/players" => "players#index"
    post "/players" => "players#create"
    get "/players/:id" => "players#show"

    get "/scores" => "scores#index"
    post "/scores" => "scores#create"
    get "/scores/:id" => "scores#show"
  end
end