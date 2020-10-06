# frozen_string_literal: true

module FavoriteMovie::Operation
  class Remove < Trailblazer::Operation
    step :model, fail_fast: true
    step :remove_favorite_movie

    def model(ctx, current_user:, params:, **)
      ctx['model'] = current_user.favorite_movies.find_by(movie_id: params[:movie_id])
    end

    def remove_favorite_movie(ctx, model:, **)
      ctx['result'] = { removed_movie_id: model.movie_id } if model.destroy
    end
  end
end
