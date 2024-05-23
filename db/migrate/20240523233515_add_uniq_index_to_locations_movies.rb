class AddUniqIndexToLocationsMovies < ActiveRecord::Migration[7.0]
  def change
    add_index :locations_movies, [:movie_id, :location_id], unique: true
  end
end
