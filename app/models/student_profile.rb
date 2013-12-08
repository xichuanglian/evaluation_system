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
      "#{self.preliminary_exam_subject} / #{self.preliminary_exam_score}"
    else
      "N/A"
    end
  end

  def get_education_infos
    self.education_infos.map{|info| info.to_s}.join("\n")
  end

  def get_classes_taken_infos
    self.classes_taken_infos.map{|info| info.to_s}.join("\n")
  end

  def get_publication_infos
    self.publication_infos.map{|info| info.to_s}.join("\n")
  end

  def get_academic_activity_infos
    self.academic_activity_infos.map{|info| info.to_s}.join("\n")
  end
end
