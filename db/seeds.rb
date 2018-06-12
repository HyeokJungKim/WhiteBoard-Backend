School.create(name:"Flatiron School")
Teacher.create(firstName:"Test", lastName:"Test", username: "1", password:"1", school_id: 1)
Student.create(firstName: "Abc", lastName: "Def", username:"1", password:"1")

5.times do
  Student.create(firstName:Faker::Name.first_name, lastName:Faker::Name.last_name)
end

5.times do
  Classroom.create(name:Faker::Hipster.word, teacher_id: 1)
end

Schedule.create(student_id: 1, classroom_id: 1)
Schedule.create(student_id: 1, classroom_id: 2)
Schedule.create(student_id: 1, classroom_id: 3)
Schedule.create(student_id: 2, classroom_id: 1)
Schedule.create(student_id: 5, classroom_id: 1)

Assignment.create(description: Faker::Hipster.word, classroom_id:1)

Grade.create(grade: 100, student_id: 1, assignment_id: 1)
Grade.create(grade: 40, student_id: 2, assignment_id: 1)
Grade.create(grade: 50, student_id: 3, assignment_id: 1)
Grade.create(grade: 20, student_id: 4, assignment_id: 1)
Grade.create(grade: 80, student_id: 5, assignment_id: 1)
