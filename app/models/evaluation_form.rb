class EvaluationForm < ActiveRecord::Base
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
end
