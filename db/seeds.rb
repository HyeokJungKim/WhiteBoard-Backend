Teacher.create(firstName:"Test", lastName:"TEST", username: "Test", password:"123")

5.times do
  Student.create(firstName:Faker::Name.first_name, lastName:Faker::Name.last_name)
end

5.times do
  Classroom.create(name:Faker::Hipster.word, teacher_id: 1, password:"123")
end

Schedule.create(student_id: 1, classroom_id: 1)
Schedule.create(student_id: 2, classroom_id: 1)
Schedule.create(student_id: 3, classroom_id: 1)
Schedule.create(student_id: 4, classroom_id: 1)
Schedule.create(student_id: 5, classroom_id: 1)

Assignment.create(description: Faker::Hipster.sentence, classroom_id:1)
Grade.create(grade: 100, student_id: 1, assignment_id: 1)
Grade.create(grade: 40, student_id: 2, assignment_id: 1)
Grade.create(grade: 50, student_id: 3, assignment_id: 1)
Grade.create(grade: 20, student_id: 4, assignment_id: 1)
Grade.create(grade: 80, student_id: 5, assignment_id: 1)
