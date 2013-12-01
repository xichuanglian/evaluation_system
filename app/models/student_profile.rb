class StudentProfile < ActiveRecord::Base
  belongs_to :student
  has_many :education_infos
  has_many :classes_taken_infos
  has_many :publication_infos
  has_many :academic_activity_infos

  def self.preliminary_exam_subjects
    ['N/A', 'Algorithm', 'Network', 'Quantum']
  end

  def self.exam_status_list
    ['N/A', 'Pass', 'Failed']
  end
end
