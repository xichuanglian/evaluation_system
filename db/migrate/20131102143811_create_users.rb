class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :job
      t.string :jobid
      t.string :email
      t.string :student_type
      t.string :enroll_year
      t.string :advisor
      t.string :co_advisor
      t.string :official_advisor
    end
  end
end