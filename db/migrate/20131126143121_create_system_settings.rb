class CreateSystemSettings < ActiveRecord::Migration
  def change
    create_table :system_settings do |t|
      t.string :key
      t.string :value
      t.timestamps
    end
  end
end
