FactoryGirl.define do
  factory :student, class: Student do
    name 'Student 1'
    jobid '2010010001'
    email 'student_1@mail.com'
    student_type :master
    association :advisor, factory: :teacher
  end

  factory :teacher, class: Teacher do
    name 'Teacher 1'
    jobid '2010020001'
    email 'teacher_1@mail.com'
    admin false
  end
end
