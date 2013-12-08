class CreateEvaluationForms < ActiveRecord::Migration
  def change
    create_table :evaluation_forms do |t|
      t.string :name
      t.string :student_jobid
      t.string :student_type
      t.string :year
      t.string :thesis_advisor
      t.string :co_advisor
      t.string :official_advisor
      t.string :preliminary_exam
      t.string :oral_exam
      t.string :thesis_proposal
      t.text :education
      t.text :classes_taken
      t.text :publications
      t.text :academic_activities
      t.text :research_progress
      t.text :plan
      t.text :suggestions
      t.text :comments
      t.integer :grade
      t.boolean :form_submitted
      t.boolean :comment_submitted
      t.belongs_to :student
      t.belongs_to :teacher
      t.belongs_to :semester
      t.timestamps
    end
  end
end
