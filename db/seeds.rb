# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


school = School.create({ name: 'Little Flatiron' })

teacher = Teacher.create(
  { first_name: 'Rose', last_name: 'Weixel', title: 'Ms.', email: 'msweixel@example.com' }
  )

course = school.courses.create({ name: '6th Grade English' })

more_courses = school.courses.create([
  { name: '6th Grade Advisory' },
  { name: '6th Grade Math' },
  { name: '6th Grade Science' },
  { name: '6th Grade History' },
  { name: 'The Awesomeness of Ruby'}
])

course_teacher_assignment = teacher.course_teacher_assignments.create({ course_id: course.id })

course_section = course_teacher_assignment.course_sections.create({ name: 'English6-001' })

students = Student.create([
  { first_name: 'Lil', last_name: 'Jimmy', email: 'liljimmy@flatiron.com'},
  { first_name: 'Lil', last_name: 'Mike', email: 'lilmike@flatiron.com'},
  { first_name: 'Lil', last_name: 'Sarah', email: 'lilsarah@flatiron.com'},
  { first_name: 'Lil', last_name: 'Steven', email: 'lilsteven@flatiron.com'},
  { first_name: 'Lil', last_name: 'Rodrigo', email: 'lilrodrigo@flatiron.com'},
  { first_name: 'Lil', last_name: 'Vaidehi', email: 'lilvaidehi@flatiron.com'},
  { first_name: 'Lil', last_name: 'Blake', email: 'lilblake@flatiron.com'},
  { first_name: 'Lil', last_name: 'Allison', email: 'lilallison@flatiron.com'},
  { first_name: 'Lil', last_name: 'Cassie', email: 'lilcassie@flatiron.com'},
  { first_name: 'Lil', last_name: 'Sam', email: 'lilsam@flatiron.com'},
  { first_name: 'Lil', last_name: 'Joe', email: 'liljoe@flatiron.com'},
  { first_name: 'Lil', last_name: 'Mitch', email: 'lilmitch@flatiron.com'},
  { first_name: 'Lil', last_name: 'Tristan', email: 'liltristan@flatiron.com'},
  { first_name: 'Lil', last_name: 'Nate', email: 'lilnate@flatiron.com'},
  { first_name: 'Lil', last_name: 'Amanda', email: 'lilamanda@flatiron.com'}
])

students.each do |student|
  student.student_course_sections.create([
    { course_section_id: course_section.id }
  ])
end

assignments = course_section.assignments.create([
  {name: "Code Everything", type: "Classwork", points: 20},
  {name: "Write About Coding", type: "Homework", points: 5},
  {name: "Practice Coding", type: "Homework", points: 5},
  {name: "Code Assessment", type: "Test", points: 10}
])

enemyship = course_section.enemyships.create(:student_id => Student.first.id, :enemy_id => Student.last.id)
buddyship = course_section.buddyships.create(:student_id => Student.second.id, :buddy_id => Student.third.id)

