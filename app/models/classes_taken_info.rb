class ClassesTakenInfo < ActiveRecord::Base
  belongs_to :student_profile

  def to_s
    "#{self.course_number}/#{self.name}/"\
    "#{self.instructor}/#{self.time}/"\
    "#{self.credits}/#{self.score}/"\
    "#{self.remark}"
  end
end
