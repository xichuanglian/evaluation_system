class CreateClassesTakenInfos < ActiveRecord::Migration
  def change
    create_table :classes_taken_infos do |t|
      t.string :course_number
      t.string :name
      t.string :instructor
      t.string :time
      t.integer :credits
      t.integer :score
      t.string :remark
      t.belongs_to :student_profile
      t.timestamps
    end
  end
end
