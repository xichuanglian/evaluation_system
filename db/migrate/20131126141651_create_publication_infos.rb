class CreatePublicationInfos < ActiveRecord::Migration
  def change
    create_table :publication_infos do |t|
      t.string :title
      t.string :co_authors
      t.string :type
      t.string :name
      t.integer :year
      t.string :form
      t.string :remark
      t.belongs_to :student_profile
      t.timestamps
    end
  end
end
