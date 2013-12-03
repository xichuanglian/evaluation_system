class AcademicActivityInfo < ActiveRecord::Base
  belongs_to :student_profile

  def self.type_list
    ["TA", "Internships", "Presentations", "Conferences Talks",
     "Seminars Talks"]
  end
end
