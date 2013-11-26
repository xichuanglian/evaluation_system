class CreateAcademicActivityInfos < ActiveRecord::Migration
  def change
    create_table :academic_activity_infos do |t|
      t.date :date
      t.string :type
      t.string :details
      t.string :remark
      t.belongs_to :student_profile
      t.timestamps
    end
  end
end
