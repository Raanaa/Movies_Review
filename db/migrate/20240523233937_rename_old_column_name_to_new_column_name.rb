class RenameOldColumnNameToNewColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :locations_movies, :actor_id, :location_id
  end
end
