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

admin = Teacher.where(jobid: "2010020001").first_or_initialize
admin.admin = true
admin.save!

# Create 10 semesters for test
5.times do |i|
  semester_autumn = Semester.where(name: "201#{i}-201#{i+1} Autumn").first_or_initialize
  semester_spring = Semester.where(name: "201#{i}-201#{i+1} Spring").first_or_initialize
  semester_autumn.open = true
  semester_autumn.save!
  semester_spring.save!
end

# Create 3 Usages
Usage.create(name: 'StudentUsage', entry: 'This is the usage for students~~~')
Usage.create(name: 'TeacherUsage', entry: 'This is the usage for teachers~~~')
Usage.create(name: 'AdminUsage', entry: 'This is the usage for admin~~~')
