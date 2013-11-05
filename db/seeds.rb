# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: 'Student 1', job: 'Student', jobid: '2010010001', email: 'student01@email.com')
User.create(name: 'Student 2', job: 'Student', jobid: '2010010002', email: 'student02@email.com')
User.create(name: 'Teacher 1', job: 'Teacher', jobid: '2010020001', email: 'teacher01@email.com')
User.create(name: 'Teacher 2', job: 'Teacher', jobid: '2010020002', email: 'teacher02@email.com')