class Teacher < ActiveRecord::Base
  has_many :students, :class_name => "Student", :inverse_of => :advisor, :foreign_key => :advisor_id
  has_many :co_advise_students, :class_name => "Student", :inverse_of => :co_advisor, :foreign_key => :co_adviosr_id
  has_many :official_advise_students, :class_name => "Student", :inverse_of => :official_advisor, :foreign_key => :official_advisor_id
  has_many :commented_forms, :class_name => "EvaluationForm", :inverse_of => :teacher
end
