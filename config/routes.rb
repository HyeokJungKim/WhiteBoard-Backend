Rails.application.routes.draw do
  resources :teachers, only: [:create]
  resources :students, only: [:create]
end
