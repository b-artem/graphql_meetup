# frozen_string_literal: true

module Mutations
  module User
    class AddListItem < AuthBaseMutation
      type Types::ListType

      description I18n.t('graphql.mutations.user.add_list_item.desc')

      argument :input, Types::Inputs::UserAddListItemInput, required: true

      def resolve(input:)
        match_operation List::Operation::AddItem.call(
          params: input.to_h,
          current_user: current_user
        )
      end
    end
  end
end
