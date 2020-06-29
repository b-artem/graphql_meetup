# frozen_string_literal: true

module FavoriteMovie::Operation
  class Add < Trailblazer::Operation
    step :find_movie
    step :add_favorite_movie

    def find_movie(ctx, params:, **)
      ctx['movie'] = Movie.find_by(id: params[:movie_id])
    end

    def add_favorite_movie(ctx, current_user:, movie:, **)
      favorite_movie = current_user.favorite_movies.create(movie: movie)
      ctx['result'] = favorite_movie.movie
    end
  end
end
