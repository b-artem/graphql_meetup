# frozen_string_literal: true

module Types
  module Inputs
    class UserAddFavoriteMovieInput < ::Types::Base::InputObject
      I18N_PATH = 'graphql.inputs.user.add_favorite_movie'

      graphql_name 'UserAddFavoriteMovieInput'

      description I18n.t("#{I18N_PATH}.desc")

      argument :movie_id,
               ID,
               required: true,
               description: I18n.t("#{I18N_PATH}.args.movie_id"),
               prepare: ->(movie_id, _ctx) { movie_id.to_i }
    end
  end
end
