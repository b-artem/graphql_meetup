# frozen_string_literal: true

module WatchlistMovie::Operation
  class Add < Trailblazer::Operation
    step :model, fail_fast: true
    step :add_watchlist_movie

    def model(ctx, params:, **)
      ctx['movie'] = Movie.find_by(id: params[:movie_id])
    end

    def add_watchlist_movie(ctx, current_user:, movie:, **)
      watchlist_movie = current_user.watchlist_movies.create(movie: movie)
      ctx['result'] = watchlist_movie.movie
    end
  end
end
