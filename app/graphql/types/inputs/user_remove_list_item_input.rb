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
               description: I18n.t("#{I18N_PATH}.args.list_id"),
               prepare: ->(list_id, _ctx) { list_id.to_i }

      argument :movie_id,
               ID,
               required: true,
               description: I18n.t("#{I18N_PATH}.args.movie_id"),
               prepare: ->(movie_id, _ctx) { movie_id.to_i }
    end
  end
end
