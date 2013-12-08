class Student < ActiveRecord::Base
  belongs_to :advisor, :class_name => "Teacher", :inverse_of => :students
  belongs_to :co_advisor, :class_name => "Teacher", :inverse_of => :co_advise_students
  belongs_to :official_advisor, :class_name => "Teacher", :inverse_of => :official_advise_students
  has_many :filled_forms, :class_name => "EvaluationForm", :inverse_of => :student
  has_one :student_profile
  has_many :education_infos, :through => :student_profile
  has_many :classes_taken_infos, :through => :student_profile
  has_many :publication_infos, :through => :student_profile
  has_many :academic_activity_infos, :through => :student_profile

  def year
    1
  end
end
