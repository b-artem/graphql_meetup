# frozen_string_literal: true

module Mutations
  module User
    class RemoveFavoriteMovie < AuthBaseMutation
      type Types::RemoveMovieType

      description I18n.t('graphql.mutations.user.remove_favorite_movie.desc')

      argument :input, Types::Inputs::UserRemoveFavoriteMovieInput, required: true

      def resolve(input:)
        match_operation FavoriteMovie::Operation::Remove.call(
          params: input.to_h,
          current_user: current_user
        )
      end
    end
  end
end
