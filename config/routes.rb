Rails.application.routes.draw do
  resources :chats

  resources :employees
  resources :project_managers, controller: 'employees', type: 'ProjectManager'
  resources :team_leaders, controller: 'employees', type: 'TeamLeader'
  resources :developers, controller: 'employees', type: 'Developer'
  resources :testers, controller: 'employees', type: 'Tester'

  resources :customers
  resources :orders

  resources :questions

  root 'chats#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
