# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create 50 students for test
50.times do |i|
  student = Student.where(jobid: "2010010%03d" % (i+1)).first_or_initialize
  r = Random.rand(10)
  teacher = Teacher.where(jobid: "2010020%03d" % (r+1)).first_or_initialize
  teacher.save!
  student.advisor = teacher
  student.save!
end
