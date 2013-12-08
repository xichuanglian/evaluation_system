class EducationInfo < ActiveRecord::Base
  belongs_to :student_profile

  def to_s
    "#{self.from}/#{self.to}/#{self.school}/#{self.remark}"
  end
end
