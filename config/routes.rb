Rails.application.routes.draw do
  resources :teachers, only: [:show, :create]
  resources :students, only: [:show, :create]
  resources :classrooms, only: [:create]
  resources :grades, only: [:show, :update]
  resources :schools, only: [:index, :create]

  post '/teacherLogin', to: 'teachers#login'
  post '/studentLogin', to: 'students#login'

  post '/schools/:id/students', to: 'schools#getStudents'
  post '/classrooms/:id/assignments', to: 'classrooms#assignments'

  get '/teachers/:id/classrooms', to: 'teachers#classesAndAssignments'
  get '/students/:id/classrooms', to: 'students#classesAndAssignments'
end
