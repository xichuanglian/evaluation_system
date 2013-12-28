FactoryGirl.define do
  factory :academic_activity_info do
    date '2013-1-2'
    activity_type 'Presentations'
    details 'none'
    remark 'none'
  end

  factory :classes_taken_info do
    course_number 'abc123'
    name 'test course'
    instructor 'Foo Bar'
    time 'sometime'
    credits '10'
    score '100'
    remark 'none'
  end
end
