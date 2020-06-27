# frozen_string_literal: true

module Mutations
  module User
    class RemoveWatchlistMovie < AuthBaseMutation
      type Types::RemovedMovieType

      description I18n.t('graphql.mutations.user.remove_watchlist_movie.desc')

      argument :input, Types::Inputs::UserRemoveWatchlistMovieInput, required: true

      def resolve(input:)
        match_operation WatchlistMovie::Operation::Remove.call(
          params: input.to_h,
          current_user: current_user
        )
      end
    end
  end
end
