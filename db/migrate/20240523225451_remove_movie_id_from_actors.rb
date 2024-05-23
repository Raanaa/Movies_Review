class RemoveMovieIdFromActors < ActiveRecord::Migration[7.0]
  def change
    remove_reference :actors, :movie, null: false, foreign_key: true
  end
end
