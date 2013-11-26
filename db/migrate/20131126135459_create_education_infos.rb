class CreateEducationInfos < ActiveRecord::Migration
  def change
    create_table :education_infos do |t|
      t.date :from
      t.date :to
      t.string :school
      t.string :remark
      t.belongs_to :student_profile
      t.timestamps
    end
  end
end
