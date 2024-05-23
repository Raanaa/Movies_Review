class RemoveIndexToActorsMovies < ActiveRecord::Migration[7.0]
  def change
    remove_index :actors_movies, name: 'index_actors_movies_on_movie_id_and_actor_id'
  end
end
