namespace :import do
  desc "Import movies and reviews from CSV"
  task import_movies_and_reviews_data: :environment do
    require 'csv'

    # import movies data
    CSV.foreach(Rails.root.join('lib/csvs/', 'movies.csv'), headers: true) do |row|
      @movie = Movie.find_by(movie: row["Movie"])
      unless @movie
        m = Movie.new
        m.movie = row["Movie"]
        m.description = row["Description"]
        m.year = row["Year"]
        m.director = row["Director"]
        m.country = row["Country"]
        m.save!
        m.actors << Actor.find_or_create_by(:name => row["Actor"]) 
        m.locations << Location.find_or_create_by(name: row["Filming location"]) 
      else
        begin
            @movie.actors << Actor.find_or_create_by(name: row["Actor"])
            @movie.locations << Location.find_or_create_by(name: row["Filming location"]) 
        rescue
            puts "duplicate record will be ignored"
        end
      end
    end
    puts "There are now #{Movie.count} rows in the Movies table and #{Actor.count} rows in the Actors table"

    # import reviews data
    CSV.foreach(Rails.root.join('lib/csvs/','reviews.csv'), headers: true) do |row|
      @movie = Movie.find_by(movie: row["Movie"])
      if @movie
        @movie.reviews << Review.find_or_create_by(
          user: row["User"],
          stars:  row["Stars"],
          review:  row["Review"]
        )
      end
    end
    puts "There are now #{Review.count} rows in the Reviews table"
  end
end

####### rake import:import_movies_and_reviews_data
