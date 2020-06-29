# frozen_string_literal: true

module Mutations
  module User
    class RemoveListItem < AuthBaseMutation
      type Types::MovieType

      description I18n.t('graphql.mutations.user.remove_list_item.desc')

      argument :input, Types::Inputs::UserRemoveListItemInput, required: true

      def resolve(input:)
        match_operation List::Operation::RemoveItem.call(
          params: input.to_h,
          current_user: current_user
        )
      end
    end
  end
end
