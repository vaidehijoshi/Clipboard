# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


school = School.create({ name: 'Little Flatiron' })

avi = Teacher.create(first_name: 'Avi', last_name: 'Flombaum', title: 'Sir', email: 'avi@example.com', school_id: school.id)
steven = Teacher.create(first_name: "Steven", last_name: "Nunez", title: "Honorable", email: "steven@example.com", school_id: school.id)
tristan = Teacher.create(first_name: "Tristan", last_name: "Seigel", title: "Mr.", email: "tristan@example.com", school_id: school.id)
mitch = Teacher.create(first_name: "Mitch", last_name: "Boyer", title: "Venerable", email: "mitch@example.com", school_id: school.id)


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
  { first_name: 'Lil Kana', last_name: 'Abe', email: 'Kana@example.com'},
  { first_name: 'Lil Don', last_name: 'Allison', email: 'Don@example.com'},
  { first_name: 'Lil Karim', last_name: 'Butt', email: 'Karim@example.com'},
  { first_name: 'Lil Joe', last_name: 'Cardarelli', email: 'Joe@example.com'},
  { first_name: 'Lil Julie', last_name: 'Carter', email: 'Julie@example.com'},
  { first_name: 'Lil Amanda', last_name: 'Chang', email: 'Amanda@example.com'},
  { first_name: 'Lil Danielle', last_name: 'Cohen-Shohet', email: 'Danielle@example.com'},
  { first_name: 'Lil Tom', last_name: 'Cohenno', email: 'Tom@example.com'},
  { first_name: 'Lil Blake', last_name: 'DeBoer', email: 'Blake@example.com'},
  { first_name: 'Lil Mike', last_name: 'Dorfman', email: 'Mike@example.com'},
  { first_name: 'Lil Matt', last_name: 'Fairbank', email: 'Matt@example.com'},
  { first_name: 'Lil Rodrigo', last_name: 'Figueroa', email: 'Rodrigo@example.com'},
  { first_name: 'Lil Molly', last_name: 'Gingras', email: 'Molly@example.com'},
  { first_name: 'Lil Ben', last_name: 'Gross', email: 'Ben@example.com'},
  { first_name: 'Lil Chelsea', last_name: 'Guster', email: 'Chelsea@example.com'},
  { first_name: 'Lil Kevin', last_name: 'Hylant', email: 'Kevin@example.com'},
  { first_name: 'Lil Sara', last_name: 'Giberson', email: 'Sara@example.com'},
  { first_name: 'Lil Vaidehi', last_name: 'Joshi', email: 'Vaidehi@example.com'},
  { first_name: 'Lil Brianne', last_name: 'King', email: 'Brianne@example.com'},
  { first_name: 'Lil Fabio', last_name: 'Kume', email: 'Fabio@example.com'},
  { first_name: 'Lil Nate', last_name: 'Kratchman', email: 'Nate@example.com'},
  { first_name: 'Lil Jimmy', last_name: 'Kuruvilla', email: 'Jimmy@example.com'},
  { first_name: 'Lil Joe', last_name: 'Lehr', email: 'Joe@example.com'},
  { first_name: 'Lil Sofia', last_name: 'Ma', email: 'Sofia@example.com'},
  { first_name: 'Lil Sam', last_name: 'Marcus', email: 'Sam@example.com'},
  { first_name: 'Lil Jarret', last_name: 'Moses', email: 'Jarret@example.com'},
  { first_name: 'Lil Ayanthika', last_name: 'Motha', email: 'Ayanthika@example.com'},
  { first_name: 'Lil Joshua', last_name: 'Owens', email: 'Joshua@example.com'},
  { first_name: 'Lil Shivani', last_name: 'Pandey', email: 'Shivani@example.com'},
  { first_name: 'Lil Draisy', last_name: 'Sabel', email: 'Draisy@example.com'},  
  { first_name: 'Lil Allison', last_name: 'Shane', email: 'Allison@example.com'},
  { first_name: 'Lil Seema', last_name: 'Shariat', email: 'Seema@example.com'},     
  { first_name: 'Lil Sarah', last_name: 'Stroh', email: 'Sarah@example.com'},  
  { first_name: 'Lil Cassie', last_name: 'Tarakajian', email: 'Cassie@example.com'},
  { first_name: 'Lil Sam', last_name: 'Tran', email: 'Sam@example.com'},
  { first_name: 'Lil Robyn', last_name: 'Trovati', email: 'Robyn@example.com'},   
  { first_name: 'Lil Thinh', last_name: 'Vu', email: 'Thinh@example.com'},   
  { first_name: 'Lil Rose', last_name: 'Weixel', email: 'Rose@example.com'},   
  { first_name: 'Lil Elizabeth', last_name: 'Wolensky', email: 'Elizabeth@example.com'},   
  { first_name: 'Lil Julia', last_name: 'Zhang', email: 'Julia@example.com'}
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

enemyship1 = rails_section.enemyships.create(:student_id => Student.all[1].id, :enemy_id => Student.all[2].id)
enemyship2 = rails_section.enemyships.create(:student_id => Student.all[3].id, :enemy_id => Student.all[4].id)
enemyship3 = rails_section.enemyships.create(:student_id => Student.all[1].id, :enemy_id => Student.all[3].id)
enemyship4 = rails_section.enemyships.create(:student_id => Student.all[8].id, :enemy_id => Student.all[10].id)
enemyship5 = rails_section.enemyships.create(:student_id => Student.all[5].id, :enemy_id => Student.all[6].id)
enemyship6 = rails_section.enemyships.create(:student_id => Student.all[7].id, :enemy_id => Student.all[15].id)
enemyship7 = rails_section.enemyships.create(:student_id => Student.all[3].id, :enemy_id => Student.all[2].id)
enemyship8 = rails_section.enemyships.create(:student_id => Student.all[20].id, :enemy_id => Student.all[22].id)
enemyship9 = rails_section.enemyships.create(:student_id => Student.all[21].id, :enemy_id => Student.all[3].id)
enemyship10 = rails_section.enemyships.create(:student_id => Student.all[13].id, :enemy_id => Student.all[14].id)

buddyship1 = rails_section.buddyships.create(:student_id => Student.all[1].id, :buddy_id => Student.all[15].id)
buddyship2 = rails_section.buddyships.create(:student_id => Student.all[3].id, :buddy_id => Student.all[6].id)
buddyship3 = rails_section.buddyships.create(:student_id => Student.all[5].id, :buddy_id => Student.all[11].id)
buddyship4 = rails_section.buddyships.create(:student_id => Student.all[20].id, :buddy_id => Student.all[25].id)
buddyship5 = rails_section.buddyships.create(:student_id => Student.all[18].id, :buddy_id => Student.all[9].id)
buddyship6 = rails_section.buddyships.create(:student_id => Student.all[24].id, :buddy_id => Student.all[6].id)
buddyship7 = rails_section.buddyships.create(:student_id => Student.all[19].id, :buddy_id => Student.all[4].id)
buddyship8 = rails_section.buddyships.create(:student_id => Student.all[19].id, :buddy_id => Student.all[5].id)
buddyship9 = rails_section.buddyships.create(:student_id => Student.all[22].id, :buddy_id => Student.all[10].id)
buddyship10 = rails_section.buddyships.create(:student_id => Student.all[7].id, :buddy_id => Student.all[11].id)


guardian0 = Guardian.create(
  first_name: "Jimmy", last_name: "Senior", email: 'bigjimmy@example.com', title: 'Lt.', address: "123 Fake Street", day_phone: "555-5555", evening_phone: "555-6666", relationship: "Father"
  )

guardian0.student = Student.all[0]

guardian0.save