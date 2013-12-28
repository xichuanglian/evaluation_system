FactoryGirl.define do
  factory :evaluation_form do
    name "Student 1"
    student_jobid "234234234234"
    student_type "master"
    association :student
    association :teacher
  end
end
