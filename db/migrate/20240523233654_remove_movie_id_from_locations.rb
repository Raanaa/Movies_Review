class RemoveMovieIdFromLocations < ActiveRecord::Migration[7.0]
  def change
    remove_reference :locations, :movie, null: false, foreign_key: true
  end
end
