class Movie < ApplicationRecord
  has_many :actors_movies
  has_many :actors, through: :actors_movies

  has_many :locations_movies
  has_many :locations, through: :locations_movies
  
  has_many :reviews, dependent: :destroy

  def avg_stars
    unless self.reviews.empty?
      self.reviews.pluck(:stars).sum / self.reviews.count # (sum of all stars / total num of reviews)
    end
  end
end
