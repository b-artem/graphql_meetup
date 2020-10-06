# frozen_string_literal: true

module Types
  module Inputs
    class UserCreateListInput < ::Types::Base::InputObject
      I18N_PATH = 'graphql.inputs.user.create_list'

      graphql_name 'UserCreateListInput'

      description I18n.t("#{I18N_PATH}.desc")

      argument :name,
               String,
               required: true,
               description: I18n.t("#{I18N_PATH}.args.name"),
               prepare: ->(name, _ctx) { name.strip }
    end
  end
end
