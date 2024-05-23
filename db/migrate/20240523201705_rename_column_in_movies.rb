class RenameColumnInMovies < ActiveRecord::Migration[7.0]
  def change
    rename_column :movies, :Year, :year
    rename_column :movies, :Director, :director
    rename_column :movies, :actor, :actor
    rename_column :movies, :Filming_location, :filming_location
    rename_column :movies, :Country, :country
  end
end
