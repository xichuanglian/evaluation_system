class CreateStudentProfiles < ActiveRecord::Migration
  def change
    create_table :student_profiles do |t|
      t.string :preliminary_exam_subject
      t.integer :preliminary_exam_score
      t.string :oral_exam
      t.string :thesis_proposal
      t.belongs_to :student
      t.timestamps
    end
  end
end
