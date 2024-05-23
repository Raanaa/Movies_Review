class AddIndexToActorsMovies < ActiveRecord::Migration[7.0]
  def change
    add_index :actors_movies, [:movie_id, :actor_id]
  end
end
