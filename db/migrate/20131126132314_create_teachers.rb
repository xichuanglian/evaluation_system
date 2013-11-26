class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :jobid
      t.string :email
      t.boolean :admin
      t.timestamps
    end
  end
end