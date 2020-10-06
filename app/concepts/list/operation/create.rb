# frozen_string_literal: true

module List::Operation
  class Create < Trailblazer::Operation
    step :create_list
    step :set_result

    def create_list(_ctx, params:, current_user:, **)
      List.create(name: params[:name], user_account: current_user)
    end

    def set_result(ctx, current_user:, **)
      ctx['result'] = current_user
    end
  end
end
