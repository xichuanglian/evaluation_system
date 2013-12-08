class EvaluationForm < ActiveRecord::Base
  belongs_to :student, :inverse_of => :filled_forms
  belongs_to :teacher, :inverse_of => :commented_forms
  belongs_to :semester

  def self.visible_fields
    [:name,
     :student_jobid,
     :student_type,
     :year,
     :thesis_advisor,
     :co_advisor,
     :official_advisor,
     :preliminary_exam,
     :oral_exam,
     :thesis_proposal,
     :education,
     :classes_taken,
     :publications,
     :academic_activities,
     :research_progress,
     :plan,
     :suggestions,
     :comments,
     :grade]
  end
  def self.required_fields
    [:preliminary_exam,
     :oral_exam,
     :thesis_proposal,
     :education,
     :classes_taken,
     :publications,
     :academic_activities,
     :research_progress,
     :plan,
     :suggestions]
  end
end
