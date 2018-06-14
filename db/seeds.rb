School.create(name:"Flatiron School", password: "123")
Teacher.create(firstName:"Eric", lastName:"Kim", username: "1", password:"1", school_id: 1)
Student.create(firstName: "Eric", lastName: "Kim", username:"1", password:"1", isAccount: true)

5.times do
  Student.create(firstName:Faker::Name.first_name, lastName:Faker::Name.last_name , username:"#{Sysrandom.hex(3)}")
end

5.times do
  Classroom.create(name:Faker::Educator.course, teacher_id: 1)
end

Schedule.create(student_id: 1, classroom_id: 1)
Schedule.create(student_id: 1, classroom_id: 2)
Schedule.create(student_id: 1, classroom_id: 3)
Schedule.create(student_id: 2, classroom_id: 1)
Schedule.create(student_id: 5, classroom_id: 1)

Assignment.create(description: "Final Project", classroom_id:1)

Grade.create(grade: 100, student_id: 1, assignment_id: 1)
Grade.create(grade: 60, student_id: 2, assignment_id: 1)
Grade.create(grade: 70, student_id: 3, assignment_id: 1)
Grade.create(grade: 80, student_id: 4, assignment_id: 1)
Grade.create(grade: 90, student_id: 5, assignment_id: 1)
