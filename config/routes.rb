Rails.application.routes.draw do
  resources :teachers, only: [:create]
  resources :students, only: [:create]
  resources :classrooms, only: [:create]


  post '/teacherLogin', to: 'teachers#login'
  post '/studentLogin', to: 'students#login'


  get'/teachers/:id/classrooms', to: 'teachers#classesAndAssignments'
  
  get'/classrooms/:id/students', to: 'classrooms#students'
end
