School.create(name:"Flatiron School", password: "123")
Teacher.create(firstName:"Eric", lastName:"Kim", username: "1", password:"1", school_id: 1)
Student.create(firstName: "Eric", lastName: "Kim", username:"1", password:"1", isAccount: true)

Classroom.create(name:'WEB-031218', teacher_id: 1)
Classroom.create(name:'WEB-040218', teacher_id: 1)
Classroom.create(name:'WEB-042318', teacher_id: 1)
Classroom.create(name:'WEB-050718', teacher_id: 1)
Classroom.create(name:'WEB-052818', teacher_id: 1)

Schedule.create(student_id: 1, classroom_id: 1)
Schedule.create(student_id: 1, classroom_id: 2)
Schedule.create(student_id: 1, classroom_id: 3)
Schedule.create(student_id: 1, classroom_id: 4)
Schedule.create(student_id: 1, classroom_id: 5)

Assignment.create(description: "Final Project", classroom_id:1)

Grade.create(grade: 100, student_id: 1, assignment_id: 1)
Grade.create(grade: 100, student_id: 2, assignment_id: 1)
Grade.create(grade: 100, student_id: 3, assignment_id: 1)
Grade.create(grade: 100, student_id: 4, assignment_id: 1)
Grade.create(grade: 100, student_id: 5, assignment_id: 1)
