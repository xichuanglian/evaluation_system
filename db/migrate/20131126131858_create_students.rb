class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :jobid
      t.string :email
      t.string :student_type
      t.belongs_to :advisor
      t.belongs_to :co_advisor
      t.belongs_to :official_advisor
      t.timestamps
    end
  end
end
