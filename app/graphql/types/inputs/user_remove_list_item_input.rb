# frozen_string_literal: true

module Types
  module Inputs
    class UserRemoveListItemInput < ::Types::Base::InputObject
      I18N_PATH = 'graphql.inputs.user.remove_list_item'

      graphql_name 'UserRemoveListItemInput'

      description I18n.t("#{I18N_PATH}.desc")

      argument :list_id,
               ID,
               required: true,
               description: I18n.t("#{I18N_PATH}.args.list_id")

      argument :movie_id,
               ID,
               required: true,
               description: I18n.t("#{I18N_PATH}.args.movie_id")
    end
  end
end
