# frozen_string_literal: true

module Mutations
  module User
    class AddFavoriteMovie < AuthBaseMutation
      type Types::MovieType

      description I18n.t('graphql.mutations.user.add_favorite_movie.desc')

      argument :input, Types::Inputs::UserAddFavoriteMovieInput, required: true

      def resolve(input:)
        match_operation FavoriteMovie::Operation::Add.call(
          params: input.to_h,
          current_user: current_user
        )
      end
    end
  end
end
