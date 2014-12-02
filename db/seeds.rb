# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


school = School.create([{ name: 'Little Flatiron' }])

teacher = Teacher.create([
  { first_name: 'Rose', last_name: 'Weixel', title: 'Ms.', email: 'msweixel@example.com' }
  ])

course = school.courses.create([{  }])
