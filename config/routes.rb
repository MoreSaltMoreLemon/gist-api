Rails.application.routes.draw do
  resources :favorite_recipes
  resources :ingredient_yield_in_grams_by_units
  resources :ingredients
  resources :step_ingredients
  resources :steps
  resources :units
  resources :user_profiles
  resources :users
  resources :recipes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
