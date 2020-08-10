Rails.application.routes.draw do
  root to: 'home#index'

  resources :car_categories

end 