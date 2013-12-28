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

  factory :education_info do
    from '2013-1-2'
    to '2013-2-2'
    school 'Tsinghua'
    remark 'none'
  end

  factory :publication_info do
    title 'Test publication'
    co_authors 'no co_authors'
    pub_type 'publication'
    name 'Test Name'
    year '2012'
    form 'paper'
    remark 'none'
  end
end
