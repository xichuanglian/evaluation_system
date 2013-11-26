class StudentProfile < ActiveRecord::Base
  belongs_to :student
  has_many :education_infos
  has_many :classes_taken_infos
  has_many :publication_infos
  has_many :academic_activity_infos
end
