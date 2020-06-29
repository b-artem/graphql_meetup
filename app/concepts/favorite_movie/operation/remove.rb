# frozen_string_literal: true

module FavoriteMovie::Operation
  class Remove < Trailblazer::Operation
    step :find_favorite_movie
    step :remove_favorite_movie

    def find_favorite_movie(ctx, current_user:, params:, **)
      ctx['model'] = current_user.favorite_movies.find_by(movie_id: params[:movie_id])
    end

    def remove_favorite_movie(ctx, model:, **)
      ctx['result'] = model.destroy
    end
  end
end
