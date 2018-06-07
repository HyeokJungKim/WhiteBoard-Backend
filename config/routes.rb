Rails.application.routes.draw do
  resources :teachers, only: [:create]
  resources :students, only: [:create]
  resources :classrooms, only: [:create]

  get'/teachers/:id/classrooms', to: 'teachers#classesAndAssignments'

  get'/classrooms/:id/students', to: 'classrooms#students'
  post '/teacherLogin', to: 'teachers#login'
end
