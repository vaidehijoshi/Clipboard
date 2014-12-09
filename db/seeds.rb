# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


school = School.create({ name: 'P.S. 29' })

avi = Teacher.create(first_name: 'Avi', last_name: 'Flombaum', title: 'Mr.', email: 'avi@example.com', school_id: school.id)
steven = Teacher.create(first_name: "Steven", last_name: "Nunez", title: "Mr.", email: "steven@example.com", school_id: school.id)
tristan = Teacher.create(first_name: "Tristan", last_name: "Seigel", title: "Mr.", email: "tristan@example.com", school_id: school.id)
mitch = Teacher.create(first_name: "Mitch", last_name: "Boyer", title: "Mr.", email: "mitch@example.com", school_id: school.id)

nancy = Teacher.create(first_name: "Nancy", last_name: "Nelson", title: "Ms.", email: "nancy@example.com", school_id: school.id)


ruby = school.courses.create({ name: 'Ruby' })
rails = school.courses.create({ name: 'Rails' })
javascript = school.courses.create({ name: 'JavaScript' })
jquery = school.courses.create({ name: 'jQuery' })

english = school.courses.create({ name: 'English' })
math = school.courses.create({ name: 'Math' })

more_courses = school.courses.create([
  { name: 'Physical Education' },
  { name: 'Art' },
  { name: 'Music' },
  { name: 'C++' },
  { name: 'History'}
])

avis_class = avi.course_teacher_assignments.create({ course_id: rails.id })
stevens_class = steven.course_teacher_assignments.create({ course_id: javascript.id })
tristans_class = tristan.course_teacher_assignments.create({ course_id: jquery.id })
mitchs_class = mitch.course_teacher_assignments.create({ course_id: ruby.id })

nancys_english_class = nancy.course_teacher_assignments.create({ course_id: english.id })
nancys_math_class = nancy.course_teacher_assignments.create({ course_id: math.id })


ruby_section = mitchs_class.course_sections.create({ name: 'Ruby-006' })
rails_section = avis_class.course_sections.create({ name: 'Rails-006' })
javascript_section = stevens_class.course_sections.create({ name: 'JavaScript-006' })
jquery_section = tristans_class.course_sections.create({ name: 'jQuery-006' })

english1_section = nancys_english_class.course_sections.create({ name: 'English-501' })
english2_section = nancys_english_class.course_sections.create({ name: 'English-502' })
math1_section = nancys_math_class.course_sections.create({ name: 'Math-501' })
math2_section = nancys_math_class.course_sections.create({ name: 'Math-502' })

students1 = Student.create([
  { first_name: 'Kana', last_name: 'Abe', email: 'Kana@example.com'},
  { first_name: 'Karim', last_name: 'Butt', email: 'Karim@example.com'},
  { first_name: 'Julie', last_name: 'Carter', email: 'Julie@example.com'},
  { first_name: 'Danielle', last_name: 'Cohen-Shohet', email: 'Danielle@example.com'},
  { first_name: 'Blake', last_name: 'DeBoer', email: 'Blake@example.com'},
  { first_name: 'Matt', last_name: 'Fairbank', email: 'Matt@example.com'},
  { first_name: 'Molly', last_name: 'Gingras', email: 'Molly@example.com'},
  { first_name: 'Chelsea', last_name: 'Guster', email: 'Chelsea@example.com'},
  { first_name: 'Sara', last_name: 'Giberson', email: 'Sara@example.com'},
  { first_name: 'Brianne', last_name: 'King', email: 'Brianne@example.com'},
  { first_name: 'Nate', last_name: 'Kratchman', email: 'Nate@example.com'},
  { first_name: 'Joe', last_name: 'Lehr', email: 'Joe@example.com'},
  { first_name: 'Sam', last_name: 'Marcus', email: 'Sam@example.com'},
  { first_name: 'Ayanthika', last_name: 'Motha', email: 'Ayanthika@example.com'},
  { first_name: 'Shivani', last_name: 'Pandey', email: 'Shivani@example.com'},
  { first_name: 'Allison', last_name: 'Shane', email: 'Allison@example.com'},
  { first_name: 'Sarah', last_name: 'Stroh', email: 'Sarah@example.com'},  
  { first_name: 'Sam', last_name: 'Tran', email: 'Sam@example.com'},
  { first_name: 'Thinh', last_name: 'Vu', email: 'Thinh@example.com'},   
  { first_name: 'Elizabeth', last_name: 'Wolensky', email: 'Elizabeth@example.com'}
])

students2 = Student.create([
  { first_name: 'Don', last_name: 'Allison', email: 'Don@example.com'},
  { first_name: 'Joe', last_name: 'Cardarelli', email: 'Joe@example.com'},
  { first_name: 'Amanda', last_name: 'Chang', email: 'Amanda@example.com'},
  { first_name: 'Tom', last_name: 'Cohenno', email: 'Tom@example.com'},
  { first_name: 'Mike', last_name: 'Dorfman', email: 'Mike@example.com'},
  { first_name: 'Rodrigo', last_name: 'Figueroa', email: 'Rodrigo@example.com'},
  { first_name: 'Ben', last_name: 'Gross', email: 'Ben@example.com'},
  { first_name: 'Kevin', last_name: 'Hylant', email: 'Kevin@example.com'},
  { first_name: 'Vaidehi', last_name: 'Joshi', email: 'Vaidehi@example.com'},
  { first_name: 'Fabio', last_name: 'Kume', email: 'Fabio@example.com'},
  { first_name: 'Jimmy', last_name: 'Kuruvilla', email: 'Jimmy@example.com'},
  { first_name: 'Sofia', last_name: 'Ma', email: 'Sofia@example.com'},
  { first_name: 'Jarret', last_name: 'Moses', email: 'Jarret@example.com'},  
  { first_name: 'Joshua', last_name: 'Owens', email: 'Joshua@example.com'},
  { first_name: 'Draisy', last_name: 'Sabel', email: 'Draisy@example.com'},   
  { first_name: 'Seema', last_name: 'Shariat', email: 'Seema@example.com'},      
  { first_name: 'Cassie', last_name: 'Tarakajian', email: 'Cassie@example.com'},  
  { first_name: 'Robyn', last_name: 'Trovati', email: 'Robyn@example.com'},      
  { first_name: 'Rose', last_name: 'Weixel', email: 'Rose@example.com'},      
  { first_name: 'Julia', last_name: 'Zhang', email: 'Julia@example.com'}
])

students1.each do |student|
  student.student_course_sections.create([
    { course_section_id: english1_section.id },
    { course_section_id: math1_section.id }
  ])
end

students2.each do |student|
  student.student_course_sections.create([
    { course_section_id: english2_section.id },
    { course_section_id: math2_section.id }
  ])
end


english1_assignments = english1_section.assignments.create([
  {name: "Reading: To the Moon and Back", category: "Homework", points: 5},
  {name: "First Thanksgiving Meal Reading & Worksheet", category: "Homework", points: 20},
  {name: "Essay: What Are You Thankful For?", category: "Homework", points: 20},
  {name: "Presentations: The", category: "Classwork", points: 30},
  {name: "Assessment: Conjunctions & Prepositions", category: "Test", points: 40}
])

english2_assignments = english2_section.assignments.create([
  {name: "Reading: To the Moon and Back", category: "Homework", points: 5},
  {name: "First Thanksgiving Meal Reading & Worksheet", category: "Homework", points: 20},
  {name: "Essay: What Are You Thankful For?", category: "Homework", points: 20},
  {name: "Presentations: The", category: "Classwork", points: 30},
  {name: "Assessment: Conjunctions & Prepositions", category: "Test", points: 40}
])

math1_assignments = math1_section.assignments.create([
  {name: "GCF Practice", category: "Classwork", points: 16},
  {name: "Geometry Assessment", category: "Test", points: 50},
  {name: "Group Work: The Coordinate Grid", category: "Classwork", points: 20},
  {name: "Coordinate Grid Worksheet", category: "Homework", points: 10}
])

math2_assignments = math2_section.assignments.create([
  {name: "GCF Practice", category: "Classwork", points: 16},
  {name: "Geometry Assessment", category: "Test", points: 50},
  {name: "Group Work: The Coordinate Grid", category: "Classwork", points: 20},
  {name: "Coordinate Grid Worksheet", category: "Homework", points: 10}
])

enemyship1 = english1_section.enemyships.create(:student_id => students1[4].id, :enemy_id => students1[9].id, :course_section_id => english1_section.id)
enemyship2 = english1_section.enemyships.create(:student_id => students1[4].id, :enemy_id => students1[16].id, :course_section_id => english1_section.id)
enemyship3 = english1_section.enemyships.create(:student_id => students1[8].id, :enemy_id => students1[10].id, :course_section_id => english1_section.id)
enemyship4 = english1_section.enemyships.create(:student_id => students1[17].id, :enemy_id => students1[6].id, :course_section_id => english1_section.id)

enemyship5 = math1_section.enemyships.create(:student_id => students1[4].id, :enemy_id => students1[9].id, :course_section_id => math1_section.id)
enemyship6 = math1_section.enemyships.create(:student_id => students1[4].id, :enemy_id => students1[16].id, :course_section_id => math1_section.id)
enemyship7 = math1_section.enemyships.create(:student_id => students1[8].id, :enemy_id => students1[10].id, :course_section_id => math1_section.id)
enemyship8 = math1_section.enemyships.create(:student_id => students1[17].id, :enemy_id => students1[6].id, :course_section_id => math1_section.id)

buddyship1 = english1_section.buddyships.create(:student_id => students1[4].id, :buddy_id => students1[18].id, :course_section_id => english1_section.id)
buddyship2 = english1_section.buddyships.create(:student_id => students1[2].id, :buddy_id => students1[5].id, :course_section_id => english1_section.id)
buddyship3 = english1_section.buddyships.create(:student_id => students1[10].id, :buddy_id => students1[6].id, :course_section_id => english1_section.id)
buddyship4 = english1_section.buddyships.create(:student_id => students1[14].id, :buddy_id => students1[15].id, :course_section_id => english1_section.id)
buddyship5 = english1_section.buddyships.create(:student_id => students1[19].id, :buddy_id => students1[5].id, :course_section_id => english1_section.id)
buddyship6 = english1_section.buddyships.create(:student_id => students1[0].id, :buddy_id => students1[4].id, :course_section_id => english1_section.id)

buddyship7 = math1_section.buddyships.create(:student_id => students1[4].id, :buddy_id => students1[18].id, :course_section_id => math1_section.id)
buddyship8 = math1_section.buddyships.create(:student_id => students1[2].id, :buddy_id => students1[5].id, :course_section_id => math1_section.id)
buddyship9 = math1_section.buddyships.create(:student_id => students1[10].id, :buddy_id => students1[6].id, :course_section_id => math1_section.id)
buddyship10 = math1_section.buddyships.create(:student_id => students1[14].id, :buddy_id => students1[15].id, :course_section_id => math1_section.id)
buddyship11= math1_section.buddyships.create(:student_id => students1[19].id, :buddy_id => students1[5].id, :course_section_id => math1_section.id)
buddyship12 = math1_section.buddyships.create(:student_id => students1[0].id, :buddy_id => students1[4].id, :course_section_id => math1_section.id)


guardian0 = Guardian.create(
  first_name: "Jimmy", last_name: "Senior", email: 'bigjimmy@example.com', title: 'Mr.', address: "123 Maple Street", day_phone: "555-5555", evening_phone: "555-6666", relationship: "Father"
  )
guardian1 = Guardian.create(
  first_name: "Sandra", last_name: "Bullock", email: 'sandy@example.com', title: 'Ms.', address: "3228 Grapevine Lane", day_phone: "555-3515", evening_phone: "555-2619", relationship: "Mother"
  )
guardian2 = Guardian.create(
  first_name: "Jen", last_name: "Aniston", email: 'jenny@example.com', title: 'Ms.', address: "1817 Boulevard Lane", day_phone: "555-5124", evening_phone: "555-4824", relationship: "Mother"
  )
guardian3 = Guardian.create(
  first_name: "Adam", last_name: "Johnson", email: 'adam@example.com', title: 'Mr.', address: "123 Orange Avenue", day_phone: "555-2371", evening_phone: "555-6128", relationship: "Father"
  )
guardian4 = Guardian.create(
  first_name: "Joe", last_name: "Jamison", email: 'joe@example.com', title: 'Mr.', address: "123 Pine Street", day_phone: "555-4948", evening_phone: "555-1009", relationship: "Father"
  )

guardian0.student = Student.all[0]
guardian1.student = Student.all[0]
guardian2.student = Student.all[2]
guardian3.student = Student.all[3]
guardian4.student = Student.all[4]

guardian0.save
guardian1.save
guardian2.save
guardian3.save
guardian4.save

