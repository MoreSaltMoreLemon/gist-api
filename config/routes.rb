Rails.application.routes.draw do
  resources :recipe_ingredients
  resources :recipe_sub_recipes
  namespace :api do
    namespace :v1 do
      get '/login', to: 'auth#new'
      post '/login', to: 'auth#create'
      post '/logout', to: 'auth#destroy'

      # resources :favorite_recipes
      # resources :ingredient_yield_in_grams_by_units
      resources :ingredients
      # resources :step_ingredients
          # resources :units
      # resources :user_profiles
      resources :users
      resources :recipes
    end
  end
end
