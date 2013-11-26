class Teacher < ActiveRecord::Base
  has_many :students, :class_name => "Student", :inverse_of => :advisor
  has_many :co_advise_students, :class_name => "Student", :inverse_of => :co_advisor
  has_many :official_advise_students, :class_name => "Student", :inverse_of => :official_advisor
  has_many :commented_forms, :class_name => "EvaluationForm", :inverse_of => :teacher
end
