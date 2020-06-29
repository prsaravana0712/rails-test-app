Rails.application.routes.draw do
  resources :customers
  resources :orders

  resources :questions

  root 'welcome#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
