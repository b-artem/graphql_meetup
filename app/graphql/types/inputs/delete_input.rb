# frozen_string_literal: true

module Types
  module Inputs
    class DeleteInput < ::Types::Base::InputObject
      I18N_PATH = 'graphql.inputs.delete_input'

      graphql_name 'DeleteInput'

      description I18n.t("#{I18N_PATH}.desc")

      argument :id,
               ID,
               required: true,
               description: I18n.t("#{I18N_PATH}.args.id"),
               prepare: ->(list_id, _ctx) { list_id.to_i }
    end
  end
end
