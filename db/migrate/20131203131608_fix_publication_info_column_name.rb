class FixPublicationInfoColumnName < ActiveRecord::Migration
  def change
    rename_column :publication_infos, :type, :pub_type
  end
end
