class Semester < ActiveRecord::Base
  has_many :evaluation_forms
end
