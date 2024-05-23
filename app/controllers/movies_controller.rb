class MoviesController < ApplicationController
  def index
    if params[:search_by_actor] and params[:search_by_actor] != ""
        actor = Actor.where("name like ?", "%" + params[:search_by_actor] + "%").first
        @movies = actor.present? ? actor.movies : []
    else
      @movies = Movie.all
    end
    
    if params[:sort]
      if params[:sort] == "des"
        @movies = Movie.left_joins(:reviews)
                            .group(:id)
                            .order('AVG(reviews.stars) DESC')
      elsif params[:sort] == "asd"
        @movies = Movie.left_joins(:reviews)
                           .group(:id)
                           .order('AVG(reviews.stars) ASC')
      end
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end
end




# app/controllers/movies_controller.rb
# class MoviesController < ApplicationController
#   def index
#     if params[:search]
#       @movies = Movie.where('actor LIKE ?', "%#{params[:search]}%")
#     else
#       @movies = Movie.left_joins(:reviews)
#                      .group(:id)
#                      .order('AVG(reviews.stars) DESC')
#     end
#   end

#   def show
#     @movie = Movie.find(params[:id])
#   end
# end