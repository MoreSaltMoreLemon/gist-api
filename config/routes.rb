Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/login', to: 'auth#new'
      post '/login', to: 'auth#create'
      post '/logout', to: 'auth#destroy'

      resources :users
      resources :recipes
      resources :recipe_steps
      resources :step_ingredients
      resources :ingredients
      resources :step_sub_recipes
      resources :units
    end
  end
end
