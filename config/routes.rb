Rails.application.routes.draw do
  resources :teachers, only: [:create]
  resources :students, only: [:create]

  get'/classrooms/teacher/:id', to: 'classrooms#classAndAssignmentsForTeacher'
  post '/teacherLogin', to: 'teachers#login'
end
