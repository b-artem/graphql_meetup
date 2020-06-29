# frozen_string_literal: true

module Mutations
  module User
    class AddWatchlistMovie < AuthBaseMutation
      type Types::MovieType

      description I18n.t('graphql.mutations.user.add_watchlist_movie.desc')

      argument :input, Types::Inputs::UserAddWatchlistMovieInput, required: true

      def resolve(input:)
        match_operation WatchlistMovie::Operation::Add.call(
          params: input.to_h,
          current_user: current_user
        )
      end
    end
  end
end
