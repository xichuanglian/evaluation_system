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

  def preliminary_exam_to_string
    if self.preliminary_exam_subject != "N/A"
      "#{self.preliminary_exam_subject} / #{self.preiminary_exam_score}"
    else
      "N/A"
    end
  end

  def education_infos_to_string
    "education_infos\neducation infos"
  end

  def classes_taken_infos_to_string
    "classes_taken_infos\nclasses taken infos"
  end

  def publication_infos_to_string
    "publication_infos\npublication infos"
  end

  def academic_activity_infos_to_string
    "academic_activity_infos\nacademic activity infos"
  end
end
