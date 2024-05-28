class RemoveForeignKeyFromLocationsMovies < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :locations_movies, :actors
  end
end
