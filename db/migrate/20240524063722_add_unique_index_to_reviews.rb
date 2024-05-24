class AddUniqueIndexToReviews < ActiveRecord::Migration[7.0]
  def change
    add_index :reviews, [:movie_id, :user], unique: true
  end
end
