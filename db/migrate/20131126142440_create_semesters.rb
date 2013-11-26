class CreateSemesters < ActiveRecord::Migration
  def change
    create_table :semesters do |t|
      t.string :name
      t.boolean :open
      t.datetime :deadline
      t.timestamps
    end
  end
end
