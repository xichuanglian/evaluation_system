class FixAcademicActivityInfoColumnName < ActiveRecord::Migration
  def change
    rename_column :academic_activity_infos, :type, :activity_type
  end
end
