Rails.application.routes.draw do
  resources :lectures
  resources :students
  resources :teachers
  resources :cars
  resources :owners
  resources :jobs
  resources :employees
  resources :tables
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
