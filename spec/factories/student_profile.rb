FactoryGirl.define do
  factory :student_profile do
    preliminary_exam_subject 'pre_exam subject'
    preliminary_exam_score '100'
    oral_exam 'pass'
    thesis_proposal 'pass'
    association :student
  end
end
