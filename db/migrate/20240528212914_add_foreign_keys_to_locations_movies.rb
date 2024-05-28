class AddForeignKeysToLocationsMovies < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :locations_movies, :locations
  end
end
