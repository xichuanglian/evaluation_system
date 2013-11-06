class CreateEvaluationForms < ActiveRecord::Migration
  def change
    create_table :evaluation_forms do |t|
      t.string :student_id
      t.string :preliminary_exam
      t.string :oral_exam
      t.string :thesis_proposal
      t.text :education
      t.text :classes_taken
      t.text :publications
      t.text :academic_activities
      t.text :researsh_progress
      t.text :plan
      t.text :suggestions
      t.text :comments
      t.integer :grade
      t.timestamps
    end
  end
end
