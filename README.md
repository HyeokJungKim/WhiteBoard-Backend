# WhiteBoard 
This is the Rails API for WhiteBoard - 
A learning management system built for educators, teachers and students. Teachers can post and share grades as well as assignments for students and check on the progress of an individual student as well the progress for the entire class.

Explore Online: <https://whiteboard-gradebook.netlify.app/>

If you would like to explore the app without creating an account, please feel free to use the following credentials to login:

```
As a Teacher:
Username: TestTeacher   
Password: abc123

As a Student:
Username: TestStudent
Password: abc123
```

*Note:* Flatiron School, App Academy, General Assembly, Fullstack Academy all has the school password of `abc123`. 

## Language and Tools

### [React](https://github.com/HyeokJungKim/WhiteBoard-Frontend)
- [Redux](https://redux.js.org/) - [Example](https://github.com/HyeokJungKim/WhiteBoard-Frontend/blob/master/src/Redux/Index.js#L5)
- [Chart JS](https://www.chartjs.org/) - [Example](https://github.com/HyeokJungKim/WhiteBoard-Frontend/blob/master/src/TeacherComponents/OneStudentInfo.js#L26)
- [React-Router](https://reactrouter.com/) - [Example](https://github.com/HyeokJungKim/WhiteBoard-Frontend/blob/master/src/App.js#L30)
- [Semantic UI React](https://react.semantic-ui.com/) - [Example](https://github.com/HyeokJungKim/WhiteBoard-Frontend/blob/master/src/Containers/HomeContainer.js#L2)

### Rails API
- [AWS S3 Storage](https://aws.amazon.com/s3/) - [Example](https://github.com/HyeokJungKim/WhiteBoard-Backend/blob/master/config/environments/production.rb#L4)
- [JWT](https://jwt.io/) - [Example](https://github.com/HyeokJungKim/WhiteBoard-Backend/blob/master/app/controllers/application_controller.rb#L11)
- [Active Model Serializer](https://github.com/rails-api/active_model_serializers) - [Example](https://github.com/HyeokJungKm/WhiteBoard-Backend/blob/master/app/serializers/teacher_serializer.rb) 
- [Postgres](https://www.postgresql.org/) - [Example](https://github.com/HyeokJungKim/WhiteBoard-Backend/blob/master/config/database.yml#L18)

## About

Register as a teacher or register as a school!
![Register](https://i.imgur.com/gfXH44u.png)

Manage multiple class rosters with different students and assignments.

![Teacher Interface](https://i.imgur.com/4wyii4k.png)
![Assignment](https://i.imgur.com/dK87GVU.png)

Check on the progress of each student's assignments as well as the class overall.

![Line](https://i.imgur.com/HYcW6PV.png)
![Donut](https://i.imgur.com/uhS4fm1.png)

As a student, see how you're doing in the class and download any uploaded assignments!

![Student Interface](https://i.imgur.com/5day8Qp.png)


## Setup
1. Make sure that `rvm` is installed on your local machine.

```
curl -sSL https://get.rvm.io | bash
rvm install 2.6.6
rvm use 2.6.6
```

2. Clone down the project and install the dependencies.

```
 git clone git@github.com:HyeokJungKim/WhiteBoard-Backend.git
 cd WhiteBoard-Backend
```

3. Download the dependencies and set up the database.
```
bundle install
rails db:create
rails db:setup
```

4. Create an .ENV file in the root directory.
```
JWT_PASSWORD=<PASSWORD FOR JWT>
AWS_ACCESS_KEY_ID=<AWS ACCESS KEY>
AWS_SECRET_ACCESS_KEY=<AWS SECRET ACCESS KEY>
AWS_REGION=<AWS REGION>
S3_BUCKET_NAME=<AWS ARN>
```

5. Change the origins in `./config/initializers/cors.rb` to the appropriate port for the corresponding frontend.

6. Run the server on port 4000.
```
rails s -p 4000
```

