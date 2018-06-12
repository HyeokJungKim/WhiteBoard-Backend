Rails.application.routes.draw do
  resources :teachers, only: [:show, :create]
  resources :students, only: [:create]
  resources :classrooms, only: [:create]
  resources :grades, only: [:show, :edit]

  post '/teacherLogin', to: 'teachers#login'
  post '/studentLogin', to: 'students#login'

  post '/classrooms/:id/assignments', to: 'classrooms#assignments'

  get '/teachers/:id/classrooms', to: 'teachers#classesAndAssignments'
  get '/students/:id/classrooms', to: 'students#classesAndAssignments'
end
