class AcademicActivityInfo < ActiveRecord::Base
  belongs_to :student_profile

  def self.type_list
    ["TA", "Internships", "Presentations", "Conferences Talks",
     "Seminars Talks"]
  end

  def to_s
    "#{self.date}/#{self.activity_type}/#{self.details}/#{self.remark}"
  end
end
