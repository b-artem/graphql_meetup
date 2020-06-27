# frozen_string_literal: true

module Mutations
  class AuthBaseMutation < BaseMutation
    def authorized?(**_kwargs)
      raise JWTSessions::Errors::Unauthorized unless current_user

      true
    end
  end
end
