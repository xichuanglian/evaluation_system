class EvaluationForm < ActiveRecord::Base
  belongs_to :student, :inverse_of => :filled_forms
  belongs_to :teacher, :inverse_of => :commented_forms
  belongs_to :semestere

  def self.visible_fields
    [:preliminary_exam,
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
