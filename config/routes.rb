Rails.application.routes.draw do
  resources :teachers, only: [:show, :create]
  resources :students, only: [:show, :create, :update]
  resources :assignments, only: [:show, :update, :destroy]
  resources :classrooms, only: [:create]
  resources :grades, only: [:show, :update]
  resources :schools, only: [:index, :create]

  post '/teacherLogin', to: 'teachers#login'
  post '/studentLogin', to: 'students#login'
  post '/validateSchool/:id', to: 'schools#validateSchool'

  post '/schools/:id/students', to: 'schools#getStudents'
  post '/classrooms/:id/assignments', to: 'classrooms#assignments'
  post '/classrooms/:id/students', to: 'classrooms#students'

  get '/teachers/:id/classrooms', to: 'teachers#classesAndAssignments'
  get '/students/:id/classrooms', to: 'students#classesAndAssignments'

  patch '/assignments/:id/update', to: 'assignments#updateAssignment'
  patch '/assignments/:id/removePDF', to: 'assignments#removePDF'
end
