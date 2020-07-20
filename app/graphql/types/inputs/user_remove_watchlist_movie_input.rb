# frozen_string_literal: true

module Types
  module Inputs
    class UserRemoveWatchlistMovieInput < ::Types::Base::InputObject
      I18N_PATH = 'graphql.inputs.user.remove_watchlist_movie'

      graphql_name 'UserRemoveWatchlistMovieInput'

      description I18n.t("#{I18N_PATH}.desc")

      argument :movie_id,
               ID,
               required: true,
               description: I18n.t("#{I18N_PATH}.args.movie_id")
    end
  end
end
