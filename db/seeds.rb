# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


school = School.create({ name: 'Little Flatiron' })

avi = Teacher.create(first_name: 'Avi', last_name: 'Flombaum', title: 'Sir', email: 'avi@flatiron.com')
steven = Teacher.create(first_name: "Steven", last_name: "Nunez", title: "Honorable", email: "steven@flatiron.com")
tristan = Teacher.create(first_name: "Tristan", last_name: "Seigel", title: "Mr.", email: "trista@flatiron.com")
mitch = Teacher.create(first_name: "Mitch", last_name: "Boyer", title: "Venerable", email: "mitch@flatiron.com")


ruby = school.courses.create({ name: 'Ruby' })
rails = school.courses.create({ name: 'Rails' })
javascript = school.courses.create({ name: 'JavaScript' })
jquery = school.courses.create({ name: 'jQuery' })

more_courses = school.courses.create([
  { name: 'PHP' },
  { name: 'Python' },
  { name: 'C' },
  { name: 'C++' },
  { name: 'Java'}
])

avis_class = avi.course_teacher_assignments.create({ course_id: rails.id })
stevens_class = steven.course_teacher_assignments.create({ course_id: javascript.id })
tristans_class = tristan.course_teacher_assignments.create({ course_id: jquery.id })
mitchs_class = mitch.course_teacher_assignments.create({ course_id: ruby.id })


ruby_section = mitchs_class.course_sections.create({ name: 'Ruby-006' })
rails_section = avis_class.course_sections.create({ name: 'Rails-006' })
javascript_section = stevens_class.course_sections.create({ name: 'JavaScript-006' })
jquery_section = tristans_class.course_sections.create({ name: 'jQuery-006' })

students = Student.create([
  { first_name: 'Lil Kana', last_name: 'Abe', email: 'Kana@flatiron.com'},
  { first_name: 'Lil Don', last_name: 'Allison', email: 'Don@flatiron.com'},
  { first_name: 'Lil Karim', last_name: 'Butt', email: 'Karim@flatiron.com'},
  { first_name: 'Lil Joe', last_name: 'Cardarelli', email: 'Joe@flatiron.com'},
  { first_name: 'Lil Julie', last_name: 'Carter', email: 'Julie@flatiron.com'},
  { first_name: 'Lil Amanda', last_name: 'Chang', email: 'Amanda@flatiron.com'},
  { first_name: 'Lil Danielle', last_name: 'Cohen-Shohet', email: 'Danielle@flatiron.com'},
  { first_name: 'Lil Tom', last_name: 'Cohenno', email: 'Tom@flatiron.com'},
  { first_name: 'Lil Blake', last_name: 'DeBoer', email: 'Blake@flatiron.com'},
  { first_name: 'Lil Mike', last_name: 'Dorfman', email: 'Mike@flatiron.com'},
  { first_name: 'Lil Matt', last_name: 'Fairbank', email: 'Matt@flatiron.com'},
  { first_name: 'Lil Rodrigo', last_name: 'Figueroa', email: 'Rodrigo@flatiron.com'},
  { first_name: 'Lil Molly', last_name: 'Gingras', email: 'Molly@flatiron.com'},
  { first_name: 'Lil Ben', last_name: 'Gross', email: 'Ben@flatiron.com'},
  { first_name: 'Lil Chelsea', last_name: 'Guster', email: 'Chelsea@flatiron.com'},
  { first_name: 'Lil Kevin', last_name: 'Hylant', email: 'Kevin@flatiron.com'},
  { first_name: 'Lil Sara', last_name: 'Giberson', email: 'Sara@flatiron.com'},
  { first_name: 'Lil Vaidehi', last_name: 'Joshi', email: 'Vaidehi@flatiron.com'},
  { first_name: 'Lil Brianne', last_name: 'King', email: 'Brianne@flatiron.com'},
  { first_name: 'Lil Fabio', last_name: 'Kume', email: 'Fabio@flatiron.com'},
  { first_name: 'Lil Nate', last_name: 'Kratchman', email: 'Nate@flatiron.com'},
  { first_name: 'Lil Jimmy', last_name: 'Kuruvilla', email: 'Jimmy@flatiron.com'},
  { first_name: 'Lil Joe', last_name: 'Lehr', email: 'Joe@flatiron.com'},
  { first_name: 'Lil Sofia', last_name: 'Ma', email: 'Sofia@flatiron.com'},
  { first_name: 'Lil Sam', last_name: 'Marcus', email: 'Sam@flatiron.com'},
  { first_name: 'Lil Jarret', last_name: 'Moses', email: 'Jarret@flatiron.com'},
  { first_name: 'Lil Ayanthika', last_name: 'Motha', email: 'Ayanthika@flatiron.com'},
  { first_name: 'Lil Joshua', last_name: 'Moses', email: 'Joshua@flatiron.com'},
  { first_name: 'Lil Shivani', last_name: 'Pandey', email: 'Shivani@flatiron.com'},
  { first_name: 'Lil Draisy', last_name: 'Sabel', email: 'Draisy@flatiron.com'},  
  { first_name: 'Lil Allison', last_name: 'Shane', email: 'Allison@flatiron.com'},
  { first_name: 'Lil Seema', last_name: 'Shariat', email: 'Seema@flatiron.com'},     
  { first_name: 'Lil Sarah', last_name: 'Stroh', email: 'Sarah@flatiron.com'},  
  { first_name: 'Lil Cassie', last_name: 'Tarakajian', email: 'Cassie@flatiron.com'},
  { first_name: 'Lil Sam', last_name: 'Tran', email: 'Sam@flatiron.com'},
  { first_name: 'Lil Robyn', last_name: 'Trovati', email: 'Robyn@flatiron.com'},   
  { first_name: 'Lil Thinh', last_name: 'Vu', email: 'Thinh@flatiron.com'},   
  { first_name: 'Lil Rose', last_name: 'Weixel', email: 'Rose@flatiron.com'},   
  { first_name: 'Lil Elizabeth', last_name: 'Wolensky', email: 'Elizabeth@flatiron.com'},   
  { first_name: 'Lil Julia', last_name: 'Zhang', email: 'Julia@flatiron.com'}
])

students.each do |student|
  student.student_course_sections.create([
    { course_section_id: rails_section.id }
  ])
end

assignments = rails_section.assignments.create([
  {name: "Code Everything", category: "Classwork", points: 20},
  {name: "Write About Coding", category: "Homework", points: 5},
  {name: "Practice Coding", category: "Homework", points: 5},
  {name: "Code Assessment", category: "Test", points: 10}
])

enemyship = rails_section.enemyships.create(:student_id => Student.all.first.id, :enemy_id => Student.last.id)
buddyship = rails_section.buddyships.create(:student_id => Student.second.id, :buddy_id => Student.third.id)

guardian = Guardian.create(
  first_name: "Jimmy", last_name: "Senior", email: 'bigjimmy@example.com', title: 'Lt.', address: "123 Fake Street", day_phone: "555-5555", evening_phone: "555-6666", relationship: "Father"
  )

guardian.student = students.first

guardian.save